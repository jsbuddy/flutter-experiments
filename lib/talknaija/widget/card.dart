import 'package:experiments/talknaija/views/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:experiments/talknaija/model.dart';

class PostCard extends StatelessWidget {
  final Post _post;

  PostCard(this._post);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
//          border: Border(bottom: BorderSide(color: Colors.black12)),
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage(_post.author.image),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _post.author.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      _post.category.toString().replaceAll('Categories.', '').toUpperCase(),
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(_post.subject),
          ),
          SizedBox(height: 10),
          Container(
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PostViewer(_post))),
              child: Hero(
                  tag: '${_post.id}',
                  child: Image.asset(
                    _post.image,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.thumb_up,
                    size: 15,
                    color: Colors.blue,
                  ),
                  label: Text('156k'),
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.question_answer,
                    size: 15,
                    color: Colors.grey,
                  ),
                  label: Text(_post.comments.length.toString()),
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    size: 15,
                    color: Colors.grey,
                  ),
                  label: Text('Share'),
                ),
              ],
            ),
          )
        ],
      ),
    );
//    return LayoutBuilder(
//      builder: (context, constraints) {
//        final double width = constraints.maxWidth / 2.5;
//        return Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 5)
//              .copyWith(top: 10, bottom: 10),
//          child: Container(
////            elevation: 0,
//          decoration: BoxDecoration(
//            color: Theme.of(context).primaryColor,
//            borderRadius: BorderRadius.circular(4),
//              boxShadow: [
//                BoxShadow(color: Colors.black12.withOpacity(.2), blurRadius: 20, offset: Offset(0, 0))
//              ]
//          ),
//            child: Stack(
//              overflow: Overflow.visible,
//              children: <Widget>[
//                Positioned(
//                  top: 10,
//                  child: Container(
//                    padding: EdgeInsets.symmetric(horizontal: 10),
//                    height: 100,
//                    width: width,
//                    child: GestureDetector(
//                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                          builder: (context) => PostViewer(_post))),
//                      child: Hero(
//                        tag: '${_post.id}',
//                        child: ClipRRect(
//                          clipBehavior: Clip.antiAlias,
//                          borderRadius: BorderRadius.all(Radius.circular(4)),
//                          child: Image.asset(
//                            _post.image,
//                            fit: BoxFit.cover,
//                            colorBlendMode: BlendMode.darken,
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//                Positioned(
//                  right: 0,
//                  width: constraints.maxWidth / 1.75,
//                  child: Container(
//                    height: 120,
//                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 7),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text(_post.subject, style: TextStyle(fontSize: 15)),
//                        Text('3 days',
//                            style: Theme.of(context).textTheme.caption),
//                        Spacer(),
//                        Row(
//                          children: <Widget>[
//                            CircleAvatar(
//                              backgroundImage: AssetImage(
//                                  'assets/images/talknaija/profile.jpeg'),
//                              radius: 10,
//                            ),
//                            SizedBox(width: 10),
//                            Text(_post.author,
//                                style: TextStyle(fontSize: 13)),
//                          ],
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//                Container(
//                  padding: EdgeInsets.only(top: 115),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.end,
//                    children: <Widget>[
//                      Divider(),
//                      Padding(
//                        padding: const EdgeInsets.symmetric(horizontal: 15)
//                            .copyWith(top: 0, bottom: 5),
//                        child: Row(
//                          children: <Widget>[
//                            Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: <Widget>[
//                                Row(
//                                  children: <Widget>[
//                                    InkWell(
//                                      onTap: () {},
//                                      borderRadius:
//                                          BorderRadius.all(Radius.circular(50)),
//                                      child: Padding(
//                                        padding: const EdgeInsets.symmetric(
//                                          vertical: 5,
//                                          horizontal: 14,
//                                        ),
//                                        child: Row(
//                                          children: <Widget>[
//                                            Icon(Icons.favorite, size: 14),
//                                            SizedBox(width: 5),
//                                            Text('233k')
//                                          ],
//                                        ),
//                                      ),
//                                    ),
//                                    InkWell(
//                                      onTap: () {},
//                                      borderRadius:
//                                          BorderRadius.all(Radius.circular(50)),
//                                      child: Padding(
//                                        padding: const EdgeInsets.symmetric(
//                                          vertical: 5,
//                                          horizontal: 14,
//                                        ),
//                                        child: Row(
//                                          children: <Widget>[
//                                            Icon(CupertinoIcons.eye_solid,
//                                                size: 18),
//                                            SizedBox(width: 5),
//                                            Text('233k')
//                                          ],
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ],
//                            ),
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        );
//      },
//    );
  }
}
