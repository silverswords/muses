import 'package:flutter/material.dart';

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
            child: Center(
              child: Text('状态栏/通知栏')
            ),
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
                    child: Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text('教学内容提纲/PPT')
                      )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.orange,
                      child: Column(
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
                      )
                    ),
                  )
                ],
              )
            ),
          ),
          Container(
            height: 40,
            color: Colors.blueAccent,
            child: Center(
              child: Text('工具栏')
            ),
          ),
        ],
      ),
    );
  }
}