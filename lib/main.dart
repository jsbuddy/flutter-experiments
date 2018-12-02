import 'layout.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyBuddy',
      home: StudyBuddy(),
      theme: ThemeData(
        fontFamily: 'Product',
//        brightness: Brightness.dark, // Comment out this line for light theme
        primarySwatch: Colors.indigo,
        buttonTheme: ButtonThemeData(
          buttonColor: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary
        )
      ),
    );
  }
}

// JASON 👇👇👇👇👇👇👇👇

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp>{

  AddCourse _addCourse;
  ViewCourse _viewCourse;

  Widget _screen;
  Widget _child;
  List <String> _courses = [];

  _MyAppState(){
    _addCourse = new AddCourse(addCourse: (){addCourse();});
    print(_addCourse);

    _screen = _addCourse;
    _child = new RaisedButton(
        child: new Text('View Courses'),
        onPressed: (){viewCourse();}
    );
  }


  void viewCourse(){
    _viewCourse = new ViewCourse(_courses);
    setState(() {

      _child = new RaisedButton(
          child: new Text('Add Course'),
          onPressed: (){addCourseScreen();}
      );
      _screen = _viewCourse;
    });
  }


  void addCourseScreen(){
    setState((){
      _screen = _addCourse;
      _child = new RaisedButton(
          child: new Text('View Courses'),
          onPressed: (){viewCourse();}
      );
    });
  }

  void addCourse(){
    String _report = '';

    if (_addCourse.title == '' || _addCourse.title == ' ' || _addCourse.title.length < 3) _report = 'Invalid value';
    else {
      setState(() {
        _courses.add(_addCourse.title);
      });
      print(_courses);
      _report = 'Course Added';
    }
    _scaffoldState.currentState.showSnackBar(new SnackBar(
        content: new Text(_report)
    ));
    _addCourse.title = '';
  }

  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey <ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text('My App'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
            child: new Column(
                children:<Widget> [_screen,_child]
            )
        ),
      ),
    );
  }
}
// }            child: new Column(
//               children: _courses.map((course) => new Text(course)).toList(),
//               ),

class AddCourse extends StatelessWidget{

  const AddCourse({
    @required this.addCourse, this.viewCourse,
  });

  final VoidCallback addCourse;
  final VoidCallback viewCourse;
  static final TextEditingController _title = new TextEditingController();
  String get title => _title.text;
  set title(String val) => val;

  @override
  Widget build(BuildContext context){
    return new Column(
        children: <Widget>[
          new TextField(
              controller: _title,
              autocorrect: true,
              decoration: new InputDecoration(
                  labelText: 'Course Title'
              )
          ),
          new RaisedButton(
              child: new Text('Add Course'),
              onPressed: addCourse
          ),
        ]
    );
  }
}

class ViewCourse extends StatelessWidget{

  final List <String> courses =  [];

  ViewCourse(List <String> gotCourses){
    gotCourses.forEach((i){
      courses.add(i);
    });
  }

  @override
  Widget build(BuildContext context){
    return new Column(
      children:
      courses.map((course) => new Text(course)).toList(),

    );
  }
}
