import 'dart:async';

import 'package:experiments/talknaija/views/settings.dart';
import 'package:experiments/talknaija/widget/card.dart';

import 'package:experiments/talknaija/widget/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  Categories _category = Categories.security;
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    this._posts = PostModel.getPosts(_category);
  }

  AppBar _buildAppBar(context) {
    return AppBar(
      title: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0).copyWith(left: 0),
            child: ClipOval(
              child: Image.asset('assets/images/talknaija/icon.png',
                  fit: BoxFit.fitHeight),
            ),
          ),
//          Text('Talk Naija', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: PostSearch());
          },
        ),
        PopupMenuButton(
          itemBuilder: (context) {
            return <PopupMenuEntry>[
              PopupMenuItem(
                child: Text('Categories'),
                value: 'categories',
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                child: Text('Setting'),
                value: 'setting',
              )
            ];
          },
          onSelected: (item) {
            switch (item) {
              case 'setting':
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
                break;
              case 'categories':
                print('Categories');
                break;
              default:
                break;
            }
          },
        ),
//        IconButton(
//          icon: Icon(Icons.settings),
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) {
//                return Settings();
//              }),
//            );
//          },
//        ),
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2)).whenComplete(() {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Feeds Refreshed')));
          });
        },
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.symmetric(
//                                vertical: 1.0, horizontal: 15)
//                            .copyWith(bottom: 10),
//                        child: Text(
//                          'Categories'.toUpperCase(),
//                          style: TextStyle(
//                              color: Theme.of(context)
//                                  .textTheme
//                                  .body1
//                                  .color
//                                  .withOpacity(.6),
//                              fontWeight: FontWeight.w700,
//                              letterSpacing: 1.2,
//                              fontSize: 12.5),
//                        ),
//                      ),
                      Container(
                        height: 70,
                        child: (ListView(
                          scrollDirection: Axis.horizontal,
//                          children: Categories.values.map((cat) => Category(
//                            name: cat.toString().replaceAll('Categories.', ''),
//                            onTap: this.handleCategoryTap(cat),
//                            isActive: _category == cat,
//                          )).toList(),
                          children: <Widget>[
                            SizedBox(width: 15),
                            Category(
                                name: 'Education',
                                icon: Icons.book,
                                onTap: () => this
                                    .handleCategoryTap(Categories.education),
                                isActive: _category == Categories.education),
                            SizedBox(width: 15),
                            Category(
                                name: 'Electricity',
                                icon: Icons.lightbulb_outline,
                                onTap: () => this
                                    .handleCategoryTap(Categories.electricity),
                                isActive: _category == Categories.electricity),
                            SizedBox(width: 15),
                            Category(
                                name: 'Diaspora',
                                icon: Icons.healing,
                                onTap: () =>
                                    this.handleCategoryTap(Categories.diaspora),
                                isActive: _category == Categories.diaspora),
                            SizedBox(width: 15),
                            Category(
                                name: 'Sports',
                                icon: Icons.directions_bike,
                                onTap: () =>
                                    this.handleCategoryTap(Categories.sports),
                                isActive: _category == Categories.sports),
                            SizedBox(width: 15),
                            Category(
                                name: 'Entertainment',
                                icon: Icons.video_library,
                                onTap: () => this.handleCategoryTap(
                                    Categories.entertainment),
                                isActive:
                                    _category == Categories.entertainment),
                            SizedBox(width: 15),
                            Category(
                                name: 'Politics',
                                icon: Icons.donut_small,
                                onTap: () =>
                                    this.handleCategoryTap(Categories.politics),
                                isActive: _category == Categories.politics),
                            SizedBox(width: 15),
                            Category(
                                name: 'Construction',
                                icon: Icons.domain,
                                onTap: () => this
                                    .handleCategoryTap(Categories.construction),
                                isActive: _category == Categories.construction),
                            SizedBox(width: 15),
                            Category(
                                name: 'Security',
                                icon: Icons.lock,
                                onTap: () =>
                                    this.handleCategoryTap(Categories.security),
                                isActive: _category == Categories.security),
                            SizedBox(width: 15),
                            Category(
                                name: 'Immigration',
                                icon: Icons.airplanemode_active,
                                onTap: () => this
                                    .handleCategoryTap(Categories.immigration),
                                isActive: _category == Categories.immigration),
                            SizedBox(width: 15),
                            Category(
                                name: 'Transportation',
                                icon: Icons.directions_bus,
                                onTap: () => this.handleCategoryTap(
                                    Categories.transportation),
                                isActive:
                                    _category == Categories.transportation),
                            SizedBox(width: 15),
                            Category(
                                name: 'Unemployment',
                                icon: Icons.supervisor_account,
                                onTap: () => this
                                    .handleCategoryTap(Categories.unemployment),
                                isActive: _category == Categories.unemployment),
                            SizedBox(width: 15)
                          ],
                        )),
                      )
                    ],
                  ),
                ),
//                SizedBox(height: 15),
//                Text(_category.toString(), style: TextStyle(fontSize: 14, color: Theme.of(context).accentColor),),
                Chip(
                  label: Text(_category.toString().replaceAll('Categories.', '').toUpperCase()),
                ),
                SizedBox(height: 10),
                _posts.length < 1
                    ? Container(
                        height: 250,
                        child: Center(
                          child: Text(
                            'No Posts for ${_category.toString().replaceAll('Categories.', '')}',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .caption
                                    .color
                                    .withOpacity(.4)),
                          ),
                        ),
                      )
                    : Column(
                        children:
                            _posts.map((post) => PostCard(post)).toList()),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  handleCategoryTap(category) {
    setState(() {
      _category = category;
      this._posts = PostModel.getPosts(_category);
    });
  }
}

class PostSearch extends SearchDelegate<Post> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
