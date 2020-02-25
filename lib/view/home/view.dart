import 'package:flutter/material.dart';

import 'package:muses/locator.dart';
import 'package:muses/routing/names.dart';
import 'package:muses/routing/router.dart';
import 'package:muses/services/navigation.dart';
import 'package:muses/widgets/navigation/bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      
      body: Column(
        children: <Widget>[
          NavigationBar(),
          Expanded(
            child: Navigator(
              key: locator<NavigationService>().navigatorKey,
              onGenerateRoute: navigationGenerateRoute,
              initialRoute: HomeWorkPlaceRoute,
            ),
          )
        ],
      ),
    );
  }
}