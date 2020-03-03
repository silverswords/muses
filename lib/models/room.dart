import 'package:equatable/equatable.dart';

class Room extends Equatable {
  Room(
    this.roomID,
    this.name,
    this.location,
    this.title,
    this.desc
  );
  final int roomID;
  final String name;
  final String location;
  final String title;
  final String desc;

  @override
  List<Object> get props => [roomID];
}