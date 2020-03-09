import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:muses/constants/colors.dart';
import 'package:muses/constants/dim.dart';

import 'package:muses/widgets/button/text.dart';
import 'package:muses/models/workspace.dart';

class Toolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkspaceStatus>(
      builder: (context, status, _) {
        return Container(
          height: toolBarHeight,
          color: toolbarColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                message: '课堂交流',
                color: status.communicationViewVisible ? toolbarTextFocusColor : Colors.white,
                onTap: () {
                  final status = Provider.of<WorkspaceStatus>(context, listen: false);
                  status.toggleCommunicationViewVisible();
                },
              ),
              TextButton(
                message: '视频提问',
                color: status.teacherViewVisible ? toolbarTextFocusColor : Colors.white,
                onTap: () {
                  final status = Provider.of<WorkspaceStatus>(context, listen: false);
                  status.toggleTeacherViewVisible();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}