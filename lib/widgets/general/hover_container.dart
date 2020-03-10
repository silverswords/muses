import 'package:flutter/material.dart';

class HoveredContainer extends StatefulWidget {
  HoveredContainer({ 
    Key key,
    this.normal,
    this.focused,
    this.child
  }) : super(key: key);

  final Color normal;
  final Color focused;
  final Widget child;

  @override
  HoveredContainerState createState() => HoveredContainerState();
}

class HoveredContainerState extends State<HoveredContainer> {
  Color background;

  @override
  void initState() {
    super.initState();

    background = widget.normal ?? Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: MouseRegion(
        onEnter: (evt) {
          if (widget.focused != null) {
            setState(() {
              background = widget.focused;
            });
          }
        },
        onExit: (evt) {
          if (widget.focused != null) {
            setState(() {
              background = widget.normal ?? Colors.transparent;
            });
          }
        },
        child: widget.child,
      ),
    );
  }
}
