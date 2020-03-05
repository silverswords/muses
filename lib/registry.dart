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

void setupPlatformView() {
  _setupMarkdownView();
  _setupObservableView();
  setMarkdownContent();
}

void setMarkdownContent() {
  window.localStorage['markdown-view-content'] = 'message from dart';
}
