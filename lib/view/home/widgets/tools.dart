import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:muses/widgets/button/text.dart';
import 'package:muses/models/workspace.dart';

class Toolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            message: '课堂交流',
            onTap: () {
              final status = Provider.of<WorkspaceStatus>(context, listen: false);
              status.toggleCommunicationViewVisible();
            },
          ),
          TextButton(
            message: '视频提问',
            onTap: () {
              final status = Provider.of<WorkspaceStatus>(context, listen: false);
              status.toggleTeacherViewVisible();
            },
          ),
        ],
      ),
    );
  }
}