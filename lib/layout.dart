import 'views/courses.dart';
import 'views/timetable.dart';
import 'package:flutter/material.dart';

class StudyBuddy extends StatefulWidget {
  @override
  StudyBuddyState createState() {
    return new StudyBuddyState();
  }
}

class StudyBuddyState extends State<StudyBuddy>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 2, vsync: this);
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Icon(Icons.book),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        )
      ],
      elevation: 0,
      bottom: TabBar(
        controller: _tabController,
        tabs: [
          Tab(icon: Icon(Icons.assessment), text: 'Study'),
          Tab(icon: Icon(Icons.grid_on), text: 'Timetable'),
          Tab(icon: Icon(Icons.book), text: 'Courses')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(child: Center(child: Text('Study'))),
          Timetable(),
          Courses()
        ],
      ),
    );
  }
}
