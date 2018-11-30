import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black38,
        ),
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent,
                image: DecorationImage(
                  image: AssetImage('assets/images/image.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 40),
        color: Colors.black38,
        child: Row(
          children: <Widget>[
            Expanded(child: Center(
              child: Column(
                children: <Widget>[
                  Text('34', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                  Text('Followers', style: TextStyle(color: Colors.cyan),),
                ],
              ),
            )),
            Expanded(child: Center(
              child: Column(
                children: <Widget>[
                  Text('2534', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                  Text('Followed', style: TextStyle(color: Colors.cyan)),
                ],
              ),
            )),
            Expanded(child: Center(
              child: Column(
                children: <Widget>[
                  Text('5', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                  Text('Saved Posts', style: TextStyle(color: Colors.cyan)),
                ],
              ),
            )),
//            Expanded(child: Text('2')),
//            Expanded(child: Text('3')),
          ],
        ),
      )
    ]);
  }
}
