import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:muses/models/presentation.dart';

import 'package:muses/constants/colors.dart';
import 'package:muses/constants/dim.dart';

import 'package:muses/widgets/button/text.dart';
import 'package:muses/models/workspace.dart';
import 'package:muses/models/presentation.dart';

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
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(width: 12),
              TextButton(
                message: '课堂交流',
                color: status.communicationViewVisible ? toolbarTextFocusColor : Colors.white,
                onTap: () {
                  final status = Provider.of<WorkspaceStatus>(context, listen: false);
                  status.toggleCommunicationViewVisible();
                },
              ),
              const SizedBox(width: 12),
              TextButton(
                message: '视频提问',
                color: status.teacherViewVisible ? toolbarTextFocusColor : Colors.white,
                onTap: () {
                  final status = Provider.of<WorkspaceStatus>(context, listen: false);
                  status.toggleTeacherViewVisible();
                },
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Consumer<Presentation>(
                builder: (context, presentations, _) {
                  return TextButton(
                    message: '下一页',
                    color: presentations.isLast ? null : Colors.white,
                    disabledColor: presentations.isLast ? toolbarTextDisabledColor : null,
                    onTap: () {
                      final presentation = Provider.of<Presentation>(context, listen: false);
                      presentation.forward();
                    },
                  );
                }
              ),
              const SizedBox(width: 12),
              Consumer<Presentation>(
                builder: (context, presentations, _) {
                  return TextButton(
                    message: '上一页',
                    color: presentations.isFirst ? null : Colors.white,
                    disabledColor: presentations.isFirst ? toolbarTextDisabledColor : null,
                    onTap: () {
                      final presentation = Provider.of<Presentation>(context, listen: false);
                      presentation.back();
                    },
                  );
                }
              ),
              const SizedBox(width: 12),
            ],
          ),
        );
      },
    );
  }
}