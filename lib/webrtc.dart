// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:convert';

import 'package:muses/utility/websocket/connection.dart';
import 'package:muses/utility/webrtc/connection.dart';
import 'package:muses/utility/media/video.dart';

const sourcePeer = 'flutter';
const targetPeer = 'observable';

WebSocketConnection ws;
WebRTCConnection pc;

void remoteShare() {
  websocketInit();
  login();

  webrtcInit();
}

void websocketInit() {
  if (ws != null) {
    return;
  }

  ws = WebSocketConnection(
    path: 'ws://127.0.0.1:8080/signal',
    onMessage: onWebSocketMessage,
  );
}

void login() {
  Future.delayed(const Duration(milliseconds: 1000), () {
    ws.send({
      'type': 'login',
      'name': sourcePeer,
    });
  });
}

void onWebSocketMessage(html.MessageEvent event) async {
  dynamic message = JsonDecoder().convert(event.data);
  print('[onWebSocketMessage] Message(${message['type']})');

  String type = message['type'];
  switch (type) {
    case 'answer':
      print('[onWebSocketMessage] Answer(${message['answer']})');
      await pc.setRemoteDescription(message['answer']);
      break;

    case 'candidate':
      dynamic candidate = message['candidate'];

      if (candidate == null) {
        sendCandidates(pc.candidates);
      }

      print('[onWebSocketMessage] Candidate($candidate}) - ${candidate.runtimeType}');
      void succeed() {
        print('[addIceCandidate] succeed');
      }

      void failed(html.DomException e) {
        print('[addIceCandidate] error ${e.message}');
      }

      await pc.addIceCandidate(html.RtcIceCandidate(candidate), succeed, failed);
      break;

    default:
  }
}

void webrtcInit() async {
  if (pc != null) {
    return;
  }

  pc = WebRTCConnection(
    onSendOffer: sendOffer,
  );

  html.MediaStream stream = await captureScreenStream();
  pc.addStream(stream);
}

bool sendOffer(html.RtcSessionDescription offer) {
  bool status = ws.send({
    'type': 'offer',
    'source': sourcePeer,
    'target': targetPeer,
    'offer': {
      'type': offer.type,
      'sdp': offer.sdp,
    }
  });

  print('[sendOffer] $status');
  return status;
}

bool sendCandidates(List candidates) {
  print('[sendCandidates] Counts: ${candidates.length}');
  for (var i = 0; i < candidates.length; i++) {
    ws.send({
      'type': 'candidate',
      'source': sourcePeer,
      'target': targetPeer,
      'candidate': candidates[i],
    });
  }

  return true;
}
