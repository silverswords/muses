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
    this.disabledColor,
    @required this.onTap
  }) : super(key: key);

  final String message;
  final Color color;
  final Color disabledColor;
  final VoidCallback onTap;

  get enabled => color != null;

  @override
  Widget build(BuildContext context) {
    return HoveredContainer(
      disabled: !enabled,
      focused: toolbarTextFocusColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: HandCursor(
          disabled: !enabled,
          child: GestureDetector(
            onTap: onTap,
            child: Center(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: toolBarTextSize,
                  color: color ?? disabledColor,
                ),
              ),
            ),
          ),
          ),
      ),
    );
  }
}