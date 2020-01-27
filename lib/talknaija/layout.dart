import 'package:experiments/talknaija/views/home.dart';
import 'package:experiments/talknaija/views/messages.dart';
import 'package:experiments/talknaija/views/profile.dart';
//import 'package:experiments/talknaija/views/settings.dart';
//import 'package:experiments/talknaija/widget/bottom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:experiments/talknaija/theme.dart';

class TalkNaija extends StatefulWidget {
  @override
  _TalkNaijaState createState() => _TalkNaijaState();
}

class _TalkNaijaState extends State<TalkNaija> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    Home(),
//    Center(child: Text('No one has buzzed you')),
    Messages(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ITheme.light,
      home: SafeArea(
        child: Scaffold(
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.shifting,
              fixedColor: Theme.of(context).iconTheme.color.withOpacity(.5),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Theme.of(context).iconTheme.color.withOpacity(.5),),
                    activeIcon: Icon(Icons.home, color: Theme.of(context).accentColor,),
                    title: Text('Home', style: TextStyle(fontSize: 12.5, color: Theme.of(context).accentColor),)),
//                BottomNavigationBarItem(
//                    icon: Icon(Icons.notifications, color: Theme.of(context).iconTheme.color.withOpacity(.5),),
//                    activeIcon: Icon(Icons.notifications, color: Theme.of(context).accentColor,),
//                    title: Text('Notifications', style: TextStyle(fontSize: 12.5, color: Theme.of(context).accentColor),)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.mail, color: Theme.of(context).iconTheme.color.withOpacity(.5),),
                    activeIcon: Icon(Icons.mail, color: Theme.of(context).accentColor,),
                    title: Text('Messages', style: TextStyle(fontSize: 12.5, color: Theme.of(context).accentColor),)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: Theme.of(context).iconTheme.color.withOpacity(.5),),
                    activeIcon: Icon(Icons.person, color: Theme.of(context).accentColor,),
                    title: Text('Profile', style: TextStyle(fontSize: 12.5, color: Theme.of(context).accentColor),)),
              ]),
        ),
      ),
    );
  }
}
