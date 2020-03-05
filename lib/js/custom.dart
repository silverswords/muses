@JS()
library custom;

import 'package:js/js.dart';

// Calls invoke JavaScript `renderObservable(path)`.
@JS('renderObservable')
external void renderObservable(String path);
