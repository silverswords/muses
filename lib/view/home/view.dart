import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:muses/constants/dim.dart';
import 'package:muses/models/workspace.dart';

import './workspace.dart';

import './widgets/teacher.dart';
import './widgets/communication.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Theme(
          // This theme effectively removes the default visual touch
          // feedback for tapping a tab, which is replaced with a custom
          // animation.
          data: theme.copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Stack(
            children: [
              WorkspaceView(),
              _builderTeacherWindow(),
              _builderCommunicationWindow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builderTeacherWindow() {
    return Consumer<WorkspaceStatus>(
      builder: (context, status, _) {
        return Visibility(
          visible: status.teacherViewVisible,
          child: Positioned(
            left: 0,
            bottom: toolBarHeight,
            child: TeacherView(),
          ),
        );
      },
    );
  }

  Widget _builderCommunicationWindow() {
    return Consumer<WorkspaceStatus>(
      builder: (context, status, _) {
        return Visibility(
          visible: status.communicationViewVisible,
          child: Positioned(
            top: statusBarHeight,
            right: 0,
            bottom: toolBarHeight,
            child: CommunicationView(),
          ),
        );
      },
    );
  }
}
