import 'package:experiments/studybuddy/views/course.dart';
import 'package:flutter/material.dart';
import 'package:experiments/studybuddy/courses.dart';

class Courses extends StatefulWidget {
  @override
  CoursesState createState() {
    return new CoursesState();
  }
}

class CoursesState extends State<Courses> {
  List<Course> _courses = courses;

  void _addCourse(BuildContext context, Course course) {
    setState(() => _courses.add(course));
    Navigator.pop(context);
  }

  Widget _buildAddCourseDialog(BuildContext context) {
    return SimpleDialog(
      title: Text('Add New Course'),
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.book,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 2),
                  ),
                  hintText: 'Course Title',
                ),
                onFieldSubmitted: (text) =>
                    _addCourse(context, Course(text, DateTime.now())),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(title: Text('Add question')),
        ListTile(title: Text('Delete course')),
        ListTile(title: Text('Reset')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
              context: context,
              builder: (context) => _buildAddCourseDialog(context)),
          child: Icon(Icons.add)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: _courses
              .map((course) => Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseView(course)));
                      },
                      onLongPress: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => _buildBottomSheet(context)),
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
