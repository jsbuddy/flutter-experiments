import '../coursedb.dart';
import 'package:flutter/material.dart';


class CourseView extends StatelessWidget {
  final Course _course;

  CourseView(this._course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_course.title}', style: TextStyle(fontSize: 18),),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: null,
            tooltip: 'Add Question',
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){},
          )
        ],
      ),
      body: ListView(
          children: <Widget>[
            Container(
                height: 10,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadiusDirectional.vertical(bottom: Radius.elliptical(500, 30))
                )
            )
          ]
      ),
    );
  }
}
