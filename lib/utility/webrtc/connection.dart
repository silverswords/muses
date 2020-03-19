// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;

typedef SignalingSend<T> = bool Function(T);

class WebRTCConnection {
  WebRTCConnection({
    this.onSendOffer
  }) {
    pc = html.RtcPeerConnection({
      'iceServers': [
        {'url': 'stun:stun.stunprotocol.org'},
      ]
    });

    if (pc == null) {
      return;
    }

    pc.onSignalingStateChange.listen(_onSignalingStateChange);
    pc.onNegotiationNeeded.listen(_onNegotiationNeeded);
    pc.onIceConnectionStateChange.listen(_onIceConnectionStateChange);
    pc.onIceCandidate.listen(_onIceCandidate);
    pc.onAddStream.listen(_onAddStream);
    pc.onRemoveStream.listen(_onRemoveStream);
  }

  html.RtcPeerConnection pc;

  final SignalingSend<html.RtcSessionDescription> onSendOffer;
  List<html.RtcIceCandidate> _candidates = [];

  get candidates => _candidates;
  get signalState => pc?.signalingState;
  get addStream => pc.addStream;
  get setRemoteDescription => pc.setRemoteDescription;
  get addIceCandidate => pc.addIceCandidate;

  _onNegotiationNeeded(dynamic event) async { 
    print('[onNegotiationNeeded]: ${event.runtimeType} - $signalState creating offer...');

    html.RtcSessionDescription offer = await pc.createOffer();

    if (signalState != 'stable') {
      print('signalState not stable yet, just return');
      return;
    }

    print('Offer type: ${offer.type}');

    await pc.setLocalDescription({
      'type': offer.type,
      'sdp': offer.sdp,
    });

    // Send to remote
    if (onSendOffer != null) {
      onSendOffer(offer);
    }
  }

  _onSignalingStateChange(event) {
    print('[onSignalingStateChange]: ${event.runtimeType} - ${pc.signalingState}');
  }

  _onIceConnectionStateChange(event) {
    final state = pc.iceConnectionState;
    print('[onIceConnectionStateChange]: ${event.runtimeType} - $state');
  }

  _onIceCandidate(html.RtcPeerConnectionIceEvent event) {
    if (event.candidate != null) {
      print('[onIceCandidate]: ${event.runtimeType} - ${event.candidate.candidate}');
      _candidates.add(event.candidate);
    }
  }

  _onAddStream(event) {
    print('[onAddStream]: ${event.runtimeType} - ${event.stream}');
  }

  _onRemoveStream(event) {
    print('[onRemoveStream]: ${event.runtimeType} - ${event.stream}');
  }
}
