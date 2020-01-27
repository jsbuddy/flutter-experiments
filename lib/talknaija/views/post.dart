import 'package:experiments/talknaija/model.dart';
import 'package:experiments/talknaija/widget/comment_view.dart';
import 'package:flutter/material.dart';

class PostViewer extends StatelessWidget {
  final Post _post;

  PostViewer(this._post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: double.infinity,
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        GestureDetector(
                          onVerticalDragEnd: (details) =>
                              Navigator.pop(context),
                          child: Hero(
                            tag: '${_post.id}',
                            child: Image.asset(
                              _post.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -25,
                          left: (constraints.maxWidth / 2) - 30,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/talknaija/profile.jpeg'),
                              radius: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16).copyWith(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      _post.category.toString().replaceAll('Categories.', '').toUpperCase(),
                      style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 2,
                          color: Theme.of(context).accentColor),
                    ),
                    SizedBox(height: 12),
                    Text(
                      _post.subject,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '4 days ago',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context)
                            .textTheme
                            .caption
                            .color
                            .withOpacity(.3),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: FractionalOffset.center,
                      child: Text(
                        _post.body,
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: Theme.of(context)
                                .textTheme
                                .body1
                                .color
                                .withOpacity(.9)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BottomSheet(
                        elevation: 5,
                        enableDrag: false,
                        onClosing: () {},
                        builder: (context) {
                          return Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(6),
                                ),
                              ),
                              constraints:
                                  BoxConstraints(minHeight: double.infinity),
                              child: _post.comments.length > 0 ? ListView(
                                children: _post.comments.map((comment) => CommentView(
                                  author: comment.author.name,
                                  body: comment.body
                                )).toList()
                              ) : Center(child: Text('No comments!'),));
                        },
                      );
                    },
                  );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
                  child: Icon(
                    Icons.comment,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                  alignment: FractionalOffset(.6, .6),
                ),
              ))
        ],
      ),
    );
  }
}
