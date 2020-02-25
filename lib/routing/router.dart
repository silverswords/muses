import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:muses/routing/names.dart';
import 'package:muses/view/workspace/view.dart';
import 'package:muses/view/setting/view.dart';

Route<dynamic> navigationGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeWorkPlaceRoute:
      return _getPageRoute(Workspace(), settings.name);
    case HomeSettingRoute:
      return _getPageRoute(Setting(), settings.name);
    default:
  }
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _PageRoute(child: child, routeName: routeName);
}

class _PageRoute extends PageRouteBuilder {
  _PageRoute({this.child, this.routeName})
    : super(
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) => child,
        settings: RouteSettings(name: routeName),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) => FadeTransition(
          opacity: animation,
          child: child,
        )
    );
      

  final Widget child;
  final String routeName;
}
