import 'package:experiments/create/widgets/reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingleCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final Gradient gradient;

  SingleCard({this.title, this.subtitle, this.gradient});

  @override
  _SingleCardState createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: widget.gradient.colors[0],
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var subtitle = widget.subtitle;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.title,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(gradient: widget.gradient),
              ),
            ),
          ),
          Positioned(
            child: Container(
              height: double.infinity,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Reveal(
                      speed: 20,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60, bottom: 20),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                    Reveal(
                      speed: 10,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(subtitle,
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontSize: 18, color: Colors.white70)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Spacer(),
                    Reveal(
                      speed: 25,
                      child: RaisedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back),
                        label: Text('Back'),
                        colorBrightness: Brightness.dark,
                        shape: StadiumBorder(),
                        elevation: 0,
                        color: Colors.white10,
                        highlightElevation: 0,
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}