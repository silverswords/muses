// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:js/js_util.dart' as jsUtil;

dynamic blobArrayBuffer(html.Blob blob) {
  return jsUtil.callMethod(blob, 'arrayBuffer', []);
}

dynamic blobToUint8List(html.Blob blob) async {
  return await jsUtil.promiseToFuture(blobArrayBuffer(blob));
}

dynamic captureScreen() {
  return jsUtil.callMethod(html.window.navigator.mediaDevices, 'getDisplayMedia', [{
    'video': {
      'cursor': 'always',
    },
    'audio': false,
  }]);
}

Future<dynamic> captureScreenShot() async {
  html.MediaStream stream = await jsUtil.promiseToFuture<html.MediaStream>(captureScreen());

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

  final video = html.VideoElement()
    ..srcObject = stream
    ..controls = true
    ..autoplay = true;

  html.window.document.querySelector('#magic').append(video);

  var track = video.srcObject.getVideoTracks()[0];
  html.ImageCapture capture = html.ImageCapture(track);
  html.ImageBitmap image = await capture.grabFrame();

  await Future.delayed(const Duration(milliseconds: 400));

  final html.CanvasElement canvas = html.CanvasElement(width: video.videoWidth, height: video.videoHeight);
  html.window.document.querySelector('#magic').append(canvas);

  html.ImageBitmapRenderingContext context = canvas.getContext('bitmaprenderer');
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
  html.MediaStream stream = await html.window.navigator.getUserMedia(video: true);

  if (stream == null) {
    return null;
  }

  var tracks = stream.getVideoTracks();
  if (tracks.length == 0) {
    return null;
  }

  var track = tracks[0];
  html.ImageCapture capture = html.ImageCapture(track);

  await Future.delayed(const Duration(seconds: 1));
  
  html.Blob image = await capture.takePhoto();

  if (image == null) {
    return null;
  }

  stopStream(stream);

  ByteBuffer data = await blobToUint8List(image);
  return data.asUint8List();
}

Future<html.MediaStream> captureScreenStream() async {
  html.MediaStream stream = await jsUtil.promiseToFuture(captureScreen());

  if (stream == null) {
    return null;
  }

  return stream;
}

void stopStream(html.MediaStream stream) {
  stream.getTracks().forEach((element) {
    element.stop();
  });
}
