import 'package:flutter/material.dart';

import 'package:muses/routing/names.dart';

import 'package:muses/widgets/input/single_line.dart';
import 'package:muses/widgets/input/password.dart';
import 'package:muses/widgets/button/filled.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _MainView(
          usernameController: _usernameController,
          passwordController: _passwordController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

enum LoginType { student, teacher }

class _MainView extends StatelessWidget {
  const _MainView({
    Key key,
    this.usernameController,
    this.passwordController,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  void _login(BuildContext context) {
    Navigator.pushNamed(context, RoomPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listViewChildren;

    final maxWidth = 500.0;

    final loginChoice = Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth
        ),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                      value: LoginType.student,
                      groupValue: LoginType.student,
                      onChanged: (LoginType value) {
                      },
                    ),
                    Text('Student')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: LoginType.teacher,
                      groupValue: LoginType.student,
                      onChanged: (LoginType value) {
                      },
                    ),
                    Text('Teacher')
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  text: 'Free Trail',
                  icon: Icons.fingerprint,
                  onTap: () {
                    _login(context);
                  },
                ),
                SizedBox(
                  width: 18,
                ),
                FilledButton(
                  text: 'Login',
                  icon: Icons.security,
                  onTap: () {
                    _login(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
    
      
    listViewChildren = [
      SingleLineInput(
        maxWidth: maxWidth,
        label: 'Username',
        controller: usernameController,
      ),
      const SizedBox(height: 12),
      PasswordInput(
        maxWidth: maxWidth,
        label: 'Password',
        controller: passwordController,
      ),
      loginChoice,
    ];

    return Column(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: listViewChildren,
            ),
          ),
        ),
      ],
    );
  }
}
