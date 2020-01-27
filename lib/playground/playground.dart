import 'package:flutter/material.dart';
import 'package:experiments/playground/theme.dart';

class Playground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ITheme.light,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Top(),
            Bottom()
          ],
        ),
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              textColor: Theme.of(context).accentColor,
              borderSide:
                  BorderSide(color: Theme.of(context).accentColor),
              highlightedBorderColor: Colors.transparent,
              onPressed: () {},
              shape: StadiumBorder(),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.book),
                ],
              ),
              highlightElevation: 0,
            ),
            SizedBox(height: 5),
            FlatButton(
              child: Text('Sign in', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              onPressed: () {},
              textColor: Colors.grey,
              textTheme: ButtonTextTheme.primary,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
            )
          ],
        ),
      ),
    );
  }
}

class Top extends StatelessWidget {
  const Top({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ClipPath(
        clipper: WaveClip(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Theme.of(context).accentColor,
                Colors.purpleAccent
              ],
            ),
          ),
          child: PageView(
            controller: PageController(viewportFraction: .75),
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 250,
                  child: Image.asset('assets/images/studybuddy/graduate-female.png'),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 250,
                  child: Image.asset('assets/images/studybuddy/write-paper-ink.png'),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 250,
                  child: Image.asset('assets/images/studybuddy/hooligans-gang.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0, size.height - 25);

    var end = Offset(size.width * 0.5, size.height - 25);
    var control = Offset(size.width * 0.25, size.height - 50);
    path.quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);

    end = Offset(size.width, size.height - 25);
    control = Offset(size.width * 0.75, size.height);
    path.quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }
}
