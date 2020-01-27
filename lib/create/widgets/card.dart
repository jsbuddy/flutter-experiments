
import 'package:experiments/create/pages/card.dart';
import 'package:flutter/material.dart';

class ICard {
  static Widget horizontal(
      {@required title,
        @required body,
        @required gradient,
        @required context}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            SingleCard(title: title, subtitle: body, gradient: gradient)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Container(
          child: Stack(children: <Widget>[
            Hero(
              tag: title,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 200,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    gradient: gradient,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                child: Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(title,
                            style: TextStyle(fontSize: 21, color: Colors.white)),
                        SizedBox(height: 10),
                        Text(
                          body,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        )
                      ],
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }

  static Widget vertical(
      {@required title,
        @required body,
        @required gradient,
        @required context}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SingleCard(title: title, subtitle: body, gradient: gradient);
        }));
      },
      child: Hero(
        tag: title,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Container(
              constraints:
              BoxConstraints(minHeight: 180, minWidth: double.infinity),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        offset: Offset(0, 10))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(title,
                        style: TextStyle(fontSize: 22, color: Colors.white)),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
