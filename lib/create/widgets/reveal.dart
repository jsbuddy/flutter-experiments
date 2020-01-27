import 'package:flutter/material.dart';

class Reveal extends StatefulWidget {
  final Widget child;
  final double speed;

  Reveal({this.child, this.speed});

  @override
  _RevealState createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _widget = widget;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => Opacity(
        opacity: _animation.value,
        child: Transform(
          transform: Matrix4.translationValues(
              0, _animation.value * _widget.speed, 0),
          child: _widget.child,
        ),
      ),
    );
  }
}
