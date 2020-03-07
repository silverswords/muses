import 'package:flutter/material.dart';

// import 'package:muses/js/custom.dart';

class RevealPresentation extends StatelessWidget {
  RevealPresentation({
    Key key,
    this.content,
  }): super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: 'reveal-presentation-view');
  }
}