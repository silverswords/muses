import 'package:flutter/material.dart';

import 'package:muses/constants/dim.dart';

class TooltipIconButton extends StatelessWidget {
  const TooltipIconButton({
    Key key,
    @required this.message,
    @required this.icon,
    this.color,
    @required this.onTap
  }) : super(key: key);

  final String message;
  final Icon icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: this.message,
      child: IconButton(
        icon: this.icon,
        iconSize: toolBarIconSize,
        autofocus: false,
        alignment: Alignment.center,
        onPressed: onTap,
      ),
    );
  }
}