import 'package:flutter/material.dart';

import 'package:muses/constants/dim.dart';

import './widgets/presentation.dart';
import './widgets/tools.dart';

class PresentationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: statusBarHeight,
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
                    flex: 1,
                    child: _presentationViewBuilder(),
                  ),
                ],
              )
            ),
          ),
           _toolsBarBuilder(),
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
    return Toolbar();
  }

  Widget _presentationViewBuilder() {
    return PresentationView();
  }
}