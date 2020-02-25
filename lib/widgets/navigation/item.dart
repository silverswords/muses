import 'package:flutter/material.dart';
import 'package:muses/locator.dart';
import 'package:muses/services/navigation.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem(this.title, this.navigationPath);

  final String title;
  final String navigationPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().to(navigationPath);
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}