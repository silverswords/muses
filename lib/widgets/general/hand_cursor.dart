import 'package:flutter/material.dart';
import 'dart:html' as html;

class HandCursor extends MouseRegion {
  static final body = html.window.document.querySelector('body');

  HandCursor({
    Key key,
    Widget child,
  }) : super(
    key: key,
    child: child,
    onHover: (evt) {
      body.style.cursor='pointer';
    },
    onExit: (evt) {
      body.style.cursor='default';
    },
  );
}