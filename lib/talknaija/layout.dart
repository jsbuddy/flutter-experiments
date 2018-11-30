import 'package:experiments/talknaija/views/home.dart';
import 'package:experiments/talknaija/views/profile.dart';
import 'package:flutter/material.dart';

class TalkNaija extends StatefulWidget {
  @override
  _TalkNaijaState createState() => _TalkNaijaState();
}

class _TalkNaijaState extends State<TalkNaija> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    Home(),
    Center(child: Text('No one has buzzed you')),
    Center(child: Text('Your messages will show here')),
    Profile(),
  ];

  final AppBar appBar = AppBar(
    title: Icon(Icons.account_balance_wallet),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: () {}),
      PopupMenuButton(
        tooltip: 'More options',
        padding: EdgeInsets.all(0.0),
        onSelected: (v) => debugPrint(v),
        itemBuilder: (context) => ['Options', 'Permissions', 'Sign out']
            .map((item) => PopupMenuItem(
                  child: Text(item, style: TextStyle(fontSize: 14.0)),
                  value: item.toLowerCase(),
                ))
            .toList(),
      )
    ],
    elevation: 0.2,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: (index) => _onItemTapped(index),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.rss_feed), title: Text('Feeds')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), title: Text('Buzz')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text('Messages')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  title: Text('Profile'),
                  activeIcon: Icon(Icons.person)),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
