import 'package:flutter/material.dart';

import 'package:muses/routing/names.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Visitor Login'),
          onPressed: () {
            Navigator.pushNamed(context, HomePageRoute);
          },
        ),
      ),
    );
  }
}