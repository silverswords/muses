import 'package:flutter/material.dart';

class SingleImagePresentation extends StatelessWidget {
  const SingleImagePresentation({
    Key key,
    @required this.url
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: 'images/loading.gif',
      image: url,
      fit: BoxFit.fill,
    );
  }
}