import 'dart:html';
import 'dart:ui' as ui;

void _setupMarkdownView() {
  ui.platformViewRegistry.registerViewFactory('reveal-presentation-view', (int viewId) => IFrameElement()
    ..id = 'reveal-presentation-view'
    ..width = '640'
    ..height = '360'
    ..src = '/reveal/index.html'
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
}
