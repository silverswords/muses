import 'package:flutter/material.dart';
import 'package:muses/routing/names.dart';

import 'item.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Workspace', HomeWorkPlaceRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Setting', HomeSettingRoute),
            ],
          )
        ],
      ),
    );
  }
}