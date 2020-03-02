import 'package:flutter/material.dart';

class SingleLineInput extends StatelessWidget {
  const SingleLineInput({
    Key key,
    @required this.maxWidth,
    @required this.label,
    @required this.controller,
  }) : super(key: key);

  final double maxWidth;
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
          ),
        ),
      ),
    );
  }
}