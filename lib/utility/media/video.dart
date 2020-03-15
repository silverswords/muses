// ignore_for_file: avoid_web_libraries_in_flutter
@JS()
library custom;

import 'dart:html';
import 'dart:typed_data';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('blobArrayBuffer')
external dynamic blobArrayBuffer(Blob blob);

dynamic blobToUint8List(Blob blob) async {
  return await promiseToFuture(blobArrayBuffer(blob));
}

@JS('captureScreen')
external dynamic captureScreen();

Future<Blob> captureScreenShot() async {
  // MediaStream stream = await promiseToFuture(captureScreen());
  MediaStream stream = await window.navigator.getUserMedia(video: true);

  print('stream object fetched $stream');

  if (stream == null) {
    return null;
  }

  var tracks = stream.getVideoTracks();
  if (tracks.length == 0) {
    return null;
  }

  var track = tracks[0];
  ImageCapture capture = ImageCapture(track);
  PhotoCapabilities cap = await capture.getPhotoCapabilities();
  if (cap != null) {
    print('takePhoto start ${cap.imageWidth.min} - ${cap.imageWidth.step} - ${cap.imageWidth.max}');
  }
  
  var image = await capture.takePhoto();

  print('takePhoto ${image.runtimeType}');

  if (image == null) {
    return null;
  }

  stopStream(stream);
  return image;
}

Future<dynamic> captureWebCamera() async {
  MediaStream stream = await window.navigator.getUserMedia(video: true);

  if (stream == null) {
    return null;
  }

  var tracks = stream.getVideoTracks();
  if (tracks.length == 0) {
    return null;
  }

  var track = tracks[0];
  ImageCapture capture = ImageCapture(track);

  await Future.delayed(const Duration(seconds: 1));
  
  Blob image = await capture.takePhoto();

  if (image == null) {
    return null;
  }

  stopStream(stream);

  ByteBuffer data = await blobToUint8List(image);
  return data.asUint8List();
}

Future<MediaStream> captureScreenImage() async {
  MediaStream stream = await promiseToFuture(captureScreen());

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
