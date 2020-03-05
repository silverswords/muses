import 'package:flutter/material.dart';

import 'package:muses/js/custom.dart';

class WorkspaceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            color: Colors.purple,
            child: _statusBarBuilder()
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _mainViewBuilder(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.orange,
                      child: _interactiveViewBuilder(),
                    ),
                  )
                ],
              )
            ),
          ),
          Container(
            height: 40,
            color: Colors.blueAccent,
            child: _toolsBarBuilder(),
          ),
        ],
      ),
    );
  }

  Widget _statusBarBuilder() {
    return Center(
      child: Text('状态栏/通知栏')
    );
  }

  Widget _toolsBarBuilder() {
    return Center(
      child: Text('工具栏')
    );
  }

  Widget _mainViewBuilder() {
    renderObservable('@fengyfei/trigonometric-functions');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: SingleChildScrollView(
        child: HtmlElementView(viewType: 'observable-view'),
      ),
    );
  }

  Widget _interactiveViewBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.orange,
            child: Center(
              child: Text('教师列表'),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.tealAccent,
            child: Center(
              child: Text('互动区域'),
            ),
          ),
        ),
      ],
    );
  }
}