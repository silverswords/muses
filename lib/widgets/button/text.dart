import 'package:flutter/material.dart';

import 'package:muses/constants/dim.dart';

class TextButton extends StatelessWidget {
  const TextButton({
    Key key,
    @required this.message,
    this.color,
    @required this.onTap
  }) : super(key: key);

  final String message;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          message,
          style: TextStyle(
            fontSize: toolBarTextSize,
            color: color
          ),
        )
      ),
    );
  }
}