import 'package:flutter/material.dart';

import 'package:muses/constants/dim.dart';
import 'package:muses/routing/names.dart';

const _horizontalPadding = 32.0;
class RoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Container(
          margin: EdgeInsets.symmetric(horizontal: _horizontalPadding),
          child: _RoomHeader(),
        ),
        RoomCard(title: 'Room I', subtitle: 'Javascript'),
        RoomCard(title: 'Room II', subtitle: 'Go'),
        RoomCard(title: 'Room III', subtitle: 'Python'),
        RoomCard(title: 'Room IV', subtitle: 'Julia'),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({this.color, this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 63,
        bottom: 21,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1.apply(
          color: color,
          fontSizeDelta: desktopDisplay1FontDelta,
        ),
      ),
    );
  }
}

class _RoomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Header(
      color: Theme.of(context).colorScheme.primary,
      text: 'Rooms',
    );
  }
}

class RoomCard extends StatelessWidget {
  const RoomCard({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      width: 400,
      margin:
          EdgeInsets.all(10),
      child: Material(
        elevation: 4,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        color: Colors.grey,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, HomePageRoute);
          },
          child: 
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    subtitle,
                    maxLines: 5,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
