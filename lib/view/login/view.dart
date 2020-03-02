import 'package:flutter/material.dart';

import 'package:muses/constants/colors.dart';
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

    final desktopMaxWidth = 400.0 + 100.0;
    listViewChildren = [
      SingleLineInput(
        maxWidth: desktopMaxWidth,
        label: 'Username',
        controller: usernameController,
      ),
      const SizedBox(height: 12),
      PasswordInput(
        maxWidth: desktopMaxWidth,
        label: 'Password',
        controller: passwordController,
      ),
      _LoginButton(
        maxWidth: desktopMaxWidth,
        onTap: () {
          _login(context);
        },
      ),
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

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key key,
    @required this.onTap,
    this.maxWidth,
  }) : super(key: key);

  final double maxWidth;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          children: [
            Icon(Icons.check_circle_outline, color: DefaultColors.buttonColor),
            const SizedBox(width: 12),
            Text('Teacher'),
            const Expanded(child: SizedBox.shrink()),
            FilledButton(
              text: 'Login',
              icon: Icons.lock,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
