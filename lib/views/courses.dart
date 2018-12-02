import 'courseview.dart';
import 'package:flutter/material.dart';
import '../coursedb.dart';


class Courses extends StatefulWidget {
  @override
  CoursesState createState() {
    return new CoursesState();
  }
}

class CoursesState extends State<Courses> {
  List<Course> _courses = courses;
  int id = courses.length + 1;
  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey <ScaffoldState>();


  void _addCourse(BuildContext context, String text) {
//    String _report = '';
//    if (text == '' || text == ' ') _report = 'Invalid entry';
//    else {
//      Course course = Course(id, text, DateTime.now());
//      setState(() => _courses.add(course));
//      id++;
//      Navigator.pop(context);
//      _report = 'Course Added';
//    }
//    _scaffoldState.currentState.showSnackBar(new SnackBar(
//        content: new Text(_report)
//    ));
    Course course = Course(id, text, DateTime.now());
    setState(() => _courses.add(course));
    id++;
    Navigator.pop(context);
  }
  void _editCourse(BuildContext context, String newTitle, int prevId) {
    _courses.forEach((course) {
      if (course.id == prevId) {
        course.title = newTitle;
      }
    });
    setState(() => _courses = _courses);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  Widget _buildAddCourseDialog(BuildContext context) {
    return SimpleDialog(
      title: Text('Add New Course '),
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(icon: Icon(Icons.book), hintText: 'Course Title'),
                onFieldSubmitted: (text) => _addCourse(context, text),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildEditCourseDialog(BuildContext context, _course) {
    return SimpleDialog(
        title: Text('Edit Course'),
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                  children: <Widget>[
                    TextFormField(
                        initialValue: _course.title,
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.book), hintText: 'Course Title'),
                        onFieldSubmitted: (text) => _editCourse(context, text, _course.id),
                        ),
                  ],
                  ),
              ),
        ],
        );
  }

  void _showAlert(BuildContext context, String courseTitle, int courseId){
    print('alert $context');
    BuildContext ctx = context;
    AlertDialog dialog = new AlertDialog(
        content: new Text('Delete $courseTitle Course? ',
            style: new TextStyle(fontSize: 20.0),),
        actions: <Widget>[
          new FlatButton(
              onPressed: (){_deleteCourse(context, courseId, ctx);},
              child: new Text('Yes')),
          new FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: new Text('No'),
          )],
        );

    // ignore: deprecated_member_use
    showDialog(context: context, child: dialog);
  }


  void _deleteCourse(BuildContext context, int courseId, BuildContext ctx){
    print('delete $context');
    _courses.removeWhere((course) => course.id == courseId);
    setState(() => _courses = _courses);
    Navigator.pop(context);
    Navigator.pop(ctx);
  }

  Widget _buildBottomSheet(BuildContext context, Course _course) {
    print('bottom $context');

    return ListView(
      children: <Widget>[
        ListTile(title: Text('Add question'), onTap: () {},),
        ListTile(title: Text('Delete course'), onTap: (){_showAlert(
            context, _course.title, _course.id);
        },),
        ListTile(title: Text('Edit Course'), onTap: () => showDialog(
            context: context,
            builder: (context) => _buildEditCourseDialog(context, _course),
            ),)
      ],
    );
  }

//  void addQuiz(){
//    print('popo');
//    print('question $_question');
//    print('answer $_answer');
//  }


  @override
  Widget build(BuildContext context) {
    print('Build $context');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
              context: context,
              builder: (context) => _buildAddCourseDialog(context)),
          child: Icon(Icons.add)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: _courses.map((course) => Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CourseView(course)));
              },
              onLongPress: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => _buildBottomSheet(context, course)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(course.title),
                  subtitle: Text(
                      'Last studied: ${course.lastStudied.day} / ${course.lastStudied.month} / ${course.lastStudied.year}'),
                ),
              ),
            ),
          ))
              .toList(),
        ),
      ),
    );
  }
}
