// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:convert';

import 'package:flutter/material.dart';

class WebSocketConnection {
  WebSocketConnection({
    @required this.path,
    @required this.onMessage,
  }) {
    _connect();

    ws.onError.listen((html.Event event) {
      ws = null;

      Future.delayed(const Duration(milliseconds: 1500), () {
        _connect();
      });
    });

    ws.onClose.listen((event) {
      ws = null;
    });

    ws.onOpen.listen((event) {
    });

    ws.onMessage.listen(onMessage);
  }

  final String path;
  html.WebSocket ws;
  final void Function(html.MessageEvent) onMessage;

  get state => (ws == null) ? html.WebSocket.CLOSED : ws.readyState;
  get available => (ws != null) && (ws.readyState == html.WebSocket.OPEN);

  void _connect() {
    assert(path != null);

    if (ws == null) {
      ws = html.WebSocket(path);
    }
  }

  bool send(dynamic message) {
    if (!available) {
      return false;
    }

    try {
      if (message is String) {
        ws.sendString(message);
      } else {
        ws.sendString(JsonEncoder().convert(message));
      }

      return true;
    } catch(e) {
      return false;
    }
  }
}
