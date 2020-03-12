import 'package:flutter/material.dart';
import 'dart:html' as html;

class HandCursor extends MouseRegion {
  static final body = html.window.document.querySelector('body');

  HandCursor({
    Key key,
    this.disabled,
    Widget child,
  }) : super(
    key: key,
    child: child,
    onHover: (evt) {
      if (disabled) {
        return;
      }

      body.style.cursor='pointer';
    },
    onExit: (evt) {
      if (disabled) {
        return;
      }

      body.style.cursor='default';
    },
  );

  final bool disabled;
}