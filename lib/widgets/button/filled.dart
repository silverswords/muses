import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  const FilledButton({
    Key key,
    @required this.text,
    this.icon,
    this.color,
    @required this.onTap
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];

    if (icon != null) {
      widgets.add(Icon(icon));
      widgets.add(SizedBox(width: 6));
    }
    widgets.add(Text(text));

    return FlatButton(
      color: color ?? Theme.of(context).buttonColor,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: onTap,
      child: Row(
        children: widgets,
      ),
    );
  }
}