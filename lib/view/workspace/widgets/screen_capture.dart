// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:muses/utility/media/video.dart';

class ScreenCaptureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 600,
      color: Color.fromRGBO(127, 255, 255, 0.7),
      child: FutureBuilder<dynamic>(
        future: captureWebCamera(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          dynamic image = snapshot.data;
          if (image == null) {
            return Center(
              child: Text('Capture Screen Failed.'),
            );
          }
          return Image.memory(image);
        },
      ),
    );
  }
}