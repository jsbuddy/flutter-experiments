import 'package:experiments/studybuddy/theme.dart';
import 'package:experiments/studybuddy/views/courses.dart';
import 'package:experiments/studybuddy/views/timetable.dart';
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
      title: Text(
        'STUDYBUDDY',
        style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2),
      ),
//      automaticallyImplyLeading: false,
//      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.more_vert),
//          onPressed: () {},
//        )
//      ],
      centerTitle: true,
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ITheme.light,
      home: Scaffold(
        appBar: _buildAppBar(),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(child: Center(child: Text('Study'))),
            Timetable(),
            Courses()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Home'),
            )
          ],
        ),
      ),
    );
  }
}
