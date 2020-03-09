import 'dart:html';
import 'dart:ui' as ui;

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

void setupPlatformView() {
  _setupMarkdownView();
  _setupObservableView();
}
