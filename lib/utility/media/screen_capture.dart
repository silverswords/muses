// ignore_for_file: avoid_web_libraries_in_flutter
@JS()
library custom;

import 'dart:html';
import 'package:js/js.dart';

@JS('captureScreen')
external MediaStream captureScreen();
