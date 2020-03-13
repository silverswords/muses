// ignore_for_file: avoid_web_libraries_in_flutter
@JS()
library custom;

import 'dart:html';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('captureScreen')
external dynamic captureScreen();

Future<MediaStream> captureScreenImage() async {
  MediaStream stream = await promiseToFuture(captureScreen());

  print('stream object fetched');

  if (stream == null) {
    return null;
  }

  return stream;
/*
  var tracks = stream.getVideoTracks();
  if (tracks.length == 0) {
    return null;
  }

  var track = tracks[0];
  ImageCapture capture = ImageCapture(track);
  print('takePhoto start');
  var image = await capture.takePhoto();

  print('takePhoto ${image.runtimeType}');

  if (image == null) {
    return null;
  }

  stopStream(stream);
  return image;
  */
}

void stopStream(MediaStream stream) {
  stream.getTracks().forEach((element) {
    element.stop();
  });
}
