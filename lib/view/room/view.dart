import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:muses/models/room.dart';
import 'package:muses/routing/names.dart';

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
                      child: _buildRoomList(),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: _buildSchedule(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoomList() {
    final entries = [
      Room(1000,
        'Javascript 入门班',
        '高阳',
        'Control Flow',
        '学习 if-else, for, while 基础知识',
      ),
      Room(1001,
        'Flutter 入门班',
        '保定',
        'Control Flow',
        '学习 if-else, for, while 基础知识',
      ),
    ];
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: _roomCardBuilder(entries[index])
        );
      }
    );
  }

  Card _roomCardBuilder(Room room) {
    return Card(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    room.name,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
                Text(
                  room.location,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.yellowAccent,
                  ),
                )
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Text(
                  '当前讲授：${room.title}',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ]
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Text(
                  room.desc,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  maxLines: 3,
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSchedule() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      foregroundDecoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://cdn.pixabay.com/photo/2016/11/30/20/58/programming-1873854_1280.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
