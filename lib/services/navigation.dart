import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> to(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  bool back() {
    return navigatorKey.currentState.pop();
  }
}