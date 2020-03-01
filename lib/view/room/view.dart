import 'package:flutter/material.dart';

import 'package:muses/routing/names.dart';
import 'package:muses/widgets/helper/decoration.dart';

class RoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Theme(
          data: theme.copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Container(
            decoration: borderWithColor(Colors.red),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, HomePageRoute);
              },
              child: Row(
                //mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.orange,
                      child: buildRoomList(),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text('Schedule')
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRoomList() {
    final entries = ['A', 'B'];
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(child: Text('Room ${entries[index]}')),
        );
      }
    );
  }
}
