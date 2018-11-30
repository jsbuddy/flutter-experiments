import 'package:experiments/talknaija/views/post.dart';
import 'package:flutter/material.dart';
import 'package:experiments/talknaija/posts.dart';

class PostCard extends StatelessWidget {
  final Post post;
  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
            child: Hero(
              tag: '${post.id}',
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => PostViewer(post))),
                child: Image.asset('assets/images/image.jpeg'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              title: Text(post.title,
                  style: Theme.of(context).primaryTextTheme.subhead),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(post.body),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 12).copyWith(left: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.thumb_up), onPressed: () {}
                        ),
                        Text('234k')
                      ],
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.comment),
                          onPressed: () {},
                        ),
                        Text('464')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}