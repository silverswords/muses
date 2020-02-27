import 'package:flutter/material.dart';

class WorkspaceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
              ), 
              child: Text('Workspace'),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
              ), 
              child: Text('Workspace'),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
              ), 
              child: Text('Workspace'),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
              ), 
              child: Text('Workspace'),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
              ), 
              child: Text('Workspace'),
            ),
          ],
        ),
      ),
    );
  }
}