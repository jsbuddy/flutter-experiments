import 'package:flutter/material.dart';

class CommentView extends StatelessWidget {
  final String author;
  final String body;

  CommentView({ this.author, this.body });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/talknaija/profile.jpeg'),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .accentColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(author, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Theme.of(context).primaryColor),),
                            SizedBox(height: 10,),
                            Text(body, style: TextStyle(fontSize: 12, height: 1.2, color: Theme.of(context).primaryColor.withOpacity(.9))),
                          ],
                        ),
                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(left: 10),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            FlatButton.icon(
//                              onPressed: () {},
//                              icon: Icon(Icons.thumb_up, size: 16,),
//                              label: Text('1234', style: TextStyle(fontSize: 12)),
//                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                              textTheme: ButtonTextTheme.primary,
//                            ),
//                            Text('25 min', style: TextStyle(fontSize: 12, color: Theme.of(context).accentColor.withOpacity(.5)),),
//                          ],
//                        ),
//                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
