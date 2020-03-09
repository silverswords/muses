import 'package:flutter/material.dart';

import 'package:muses/js/custom.dart';

class RevealPresentation extends StatelessWidget {
  RevealPresentation({
    Key key,
    @required this.content,
  }): super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 200), () {
      renderRevealPresentation(content);
    });
    return HtmlElementView(viewType: 'reveal-presentation-view');
  }
}