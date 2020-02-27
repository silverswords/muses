import 'dart:html';
import 'dart:js' as js;
import 'dart:ui' as ui;

void _setupMarkdownView() {
  ui.platformViewRegistry.registerViewFactory('markdown-view', (int viewId) => IFrameElement()
    ..id = 'markdown-view'
    ..width = '640'
    ..height = '360'
    ..src = '/markdown/index.html'
    ..style.border = 'none'
  );
}

void setupPlatformView() {
  _setupMarkdownView();
  setMarkdownContent();
}

void setMarkdownContent() {
  window.localStorage['markdown-view-content'] = 'message from dart';
}
