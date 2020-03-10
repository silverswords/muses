import 'package:flutter/material.dart';

import 'package:muses/constants/colors.dart';
import 'package:muses/constants/dim.dart';
import 'package:muses/widgets/general/hand_cursor.dart';
import 'package:muses/widgets/general/hover_container.dart';

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
    return HoveredContainer(
      focused: toolbarTextFocusColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: HandCursor(
          child: GestureDetector(
            onTap: onTap,
            child: Center(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: toolBarTextSize,
                  color: color
                ),
              ),
            ),
          ),
          ),
      ),
    );
  }
}