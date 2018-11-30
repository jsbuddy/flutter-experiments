import 'package:experiments/talknaija/widget/card.dart';
import 'package:experiments/talknaija/widget/category.dart';
import 'package:flutter/material.dart';
import '../posts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 2)).whenComplete(() {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Feeds Refreshed')));
        });
      },
      child: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'Categories',
              style: Theme.of(context)
                  .primaryTextTheme
                  .subhead
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 100.0,
            child: (ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Category('Education', Icons.book),
                Category('Sports', Icons.airplanemode_active),
                Category('Entertainment', Icons.video_library),
                Category('Politics', Icons.donut_small),
                Category('Construction', Icons.domain),
                Category('Games', Icons.videogame_asset),
                SizedBox(
                  width: 16.0,
                )
              ],
            )),
          ),
          SizedBox(height: 10),
          Column(children: posts.map((post) => PostCard(post)).toList()),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}