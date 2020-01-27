//import 'package:experiments/playground/playground.dart';
//import 'package:experiments/studybuddy/layout.dart';
//import 'package:experiments/useless/random_words.dart';
//import 'package:experiments/create/create.dart';
import 'package:experiments/create/create.dart';
import 'package:experiments/learn/calculator.dart';
import 'package:experiments/studybuddy/layout.dart';
import 'package:experiments/talknaija/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:experiments/playground/playground.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterCreate();
//    return TalkNaija();
//    return Playground();
//    return StudyBuddy();
//    return Calculator();

//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Calculator(),
//    );
  }
}

// TalkNaija
// StudyBuddy
// RandomWords
