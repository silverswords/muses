// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';

import 'package:muses/constants/elements.dart';
import 'package:muses/utility/media/screen_capture.dart';

class ScreenShareView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 600,
      color: Color.fromRGBO(127, 255, 255, 0.7),
      child: FutureBuilder<MediaStream>(
        future: captureScreenImage(),
        builder: (BuildContext context, AsyncSnapshot<MediaStream> snapshot) {
          MediaStream stream = snapshot.data;
          if (stream == null) {
            return Center(
              child: Text('Capture Screen Failed.'),
            );
          }

          if (screenCaptureVideo.srcObject != null) {
            stopStream(screenCaptureVideo.srcObject);
            screenCaptureVideo.srcObject = null;
          }

          screenCaptureVideo.srcObject = stream;
          return HtmlElementView(viewType: 'screen-capture-video');
        },
      ),
    );
  }
}