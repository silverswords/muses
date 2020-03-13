// ignore_for_file: avoid_web_libraries_in_flutter
// ignore_for_file: undefined_prefixed_name

import 'dart:html';
import 'dart:ui' as ui;

import 'package:muses/constants/elements.dart';

void _setupMarkdownView() {
  ui.platformViewRegistry.registerViewFactory('reveal-presentation-view', (int viewId) => DivElement()
    ..id = 'reveal-presentation-view'
    ..style.border = 'none'
    ..style.width = '100%'
    ..style.height = '100%'
  );
}

void _setupObservableView() {
  ui.platformViewRegistry.registerViewFactory('observable-view', (int viewId) => DivElement()
    ..id = 'observable-view'
    ..style.border = 'none'
    ..style.width = '100%'
    ..style.height = '100%'
    ..style.backgroundColor = '#fff'
    ..style.padding = '0 4px 0 4px'
    ..style.textAlign = 'center'
  );
}

void _registerScreeCaptureVideoView() {
  ui.platformViewRegistry.registerViewFactory('screen-capture-video', (int viewId) => screenCaptureVideo);
}

void registerScreenCaptureCanvasView(CanvasElement canvas) {
  ui.platformViewRegistry.registerViewFactory('screen-capture-canvas', (int viewId) => canvas);
}

void setupPlatformView() {
  _setupMarkdownView();
  _setupObservableView();
  _registerScreeCaptureVideoView();
}
