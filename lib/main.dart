import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:muses/providers/providers.dart';
import 'package:muses/locator.dart';
import 'package:muses/registry.dart';
import 'package:muses/routing/names.dart';
import 'package:muses/view/login/view.dart';
import 'package:muses/view/room/view.dart';
import 'package:muses/view/workspace/view.dart';

import './webrtc.dart';

void main() {
  setupLocator();
  setupPlatformView();
  remoteShare();
  runApp(Application());
}

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: MaterialApp(
        // Start the app with the "/" named route. In this case, the app starts
        // on the FirstScreen widget.
        initialRoute: LoginPageRoute,
        theme: ThemeData.dark(),
        routes: {
          LoginPageRoute: (context) => LoginPage(),
          RoomPageRoute: (context) => RoomPage(),
          WorkspacePageRoute: (context) => HomePage(),
        },
      ),
    );
  }
}
