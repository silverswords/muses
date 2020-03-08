import 'package:flutter/material.dart';

import 'package:muses/js/custom.dart';

class ObservableNotebook extends StatelessWidget {
  ObservableNotebook({
    Key key,
    this.notebook,
  }): super(key: key);

  final String notebook;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 200), () {
      renderObservable(this.notebook);
    });

    return SingleChildScrollView(
      child: HtmlElementView(viewType: 'observable-view'),
    );
  }
}