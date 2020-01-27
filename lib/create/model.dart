import 'package:flutter/material.dart';

class Item {
  String title;
  String body;
  Gradient gradient;

  Item({@required this.title, @required this.body, @required this.gradient});
}

class IPreferences {
  final bool nightMode;
  final bool horizontalCardView;

  IPreferences({this.horizontalCardView, this.nightMode});
}

List items = <Item>[
  Item(
    title: 'Node JS',
    body: 'A runtime environment for executing Javascript code on the server',
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.blueAccent],
      begin: Alignment(0, 0),
      end: Alignment(1, 1),
    ),
  ),
  Item(
    title: 'Dart',
    body: 'A new programming language from google',
    gradient: LinearGradient(
      colors: [Colors.purple, Colors.purpleAccent],
      begin: Alignment(0, 0),
      end: Alignment(1, 1),
    ),
  ),
  Item(
    title: 'Javascript',
    body: 'Client / Server side language, the peoples favorite',
    gradient: LinearGradient(
      colors: [Colors.orange, Colors.orangeAccent],
      begin: Alignment(0, 0),
      end: Alignment(1, 1),
    ),
  ),
  Item(
    title: 'Go',
    body: 'Client / Server side language, the peoples favorite',
    gradient: LinearGradient(
      colors: [Colors.black87, Colors.black],
      begin: Alignment(0, 0),
      end: Alignment(1, 1),
    ),
  )
];
