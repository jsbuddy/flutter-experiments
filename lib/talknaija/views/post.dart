import 'package:experiments/talknaija/posts.dart';
import 'package:flutter/material.dart';

class PostViewer extends StatelessWidget {
  final Post _post;
  PostViewer(this._post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hello')),
        body: Container(
          color: Colors.red,
          width: double.infinity,
          child: Hero(
            tag: '${_post.id}',
            child: Image.asset('assets/images/image.jpeg'),
          ),
        ));
  }
}
