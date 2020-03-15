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

Future<dynamic> captureScreenShot() async {
  MediaStream stream = await promiseToFuture(captureScreen());

  if (stream == null) {
    return null;
  }

  var tracks = stream.getVideoTracks();
  if (tracks.length == 0) {
    return null;
  }

  if (tracks.length == 0) {
    return null;
  }

  final video = VideoElement()
    ..srcObject = stream
    ..controls = true
    ..autoplay = true;

  window.document.querySelector('#magic').append(video);

  var track = video.srcObject.getVideoTracks()[0];
  ImageCapture capture = ImageCapture(track);
  ImageBitmap image = await capture.grabFrame();

  await Future.delayed(const Duration(milliseconds: 400));

  final CanvasElement canvas = CanvasElement(width: video.videoWidth, height: video.videoHeight);
  window.document.querySelector('#magic').append(canvas);

  ImageBitmapRenderingContext context = canvas.getContext('bitmaprenderer');
  context.transferFromImageBitmap(image);

  stopStream(stream);

  video.srcObject = null;
  video.remove();

  final blob = await canvas.toBlob('image/png');
  ByteBuffer data = await blobToUint8List(blob);

  canvas.remove();

  return data.asUint8List();
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

Future<MediaStream> captureScreenStream() async {
  MediaStream stream = await promiseToFuture(captureScreen());

  if (stream == null) {
    return null;
  }

  return stream;
}

void stopStream(MediaStream stream) {
  stream.getTracks().forEach((element) {
    element.stop();
  });
}
