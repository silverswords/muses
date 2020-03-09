import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:muses/widgets/button/icon.dart';
import 'package:muses/models/workspace.dart';

class Toolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TooltipIconButton(
            message: 'Communication View',
            icon: Icon(Icons.chat),
            onTap: () {
              final status = Provider.of<WorkspaceStatus>(context, listen: false);
              status.toggleCommunicationViewVisible();
            },
          ),
          TooltipIconButton(
            message: 'Teachers List',
            icon: Icon(Icons.people),
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