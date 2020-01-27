import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Widget _buildItem(BuildContext context, String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            label, style: TextStyle(fontSize: 12, color: Theme
              .of(context)
              .accentColor),
          ),
          Text(value, style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Profile'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
        )
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) =>
            ListView(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .cardColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(.05),
                                blurRadius: 4,
                                spreadRadius: -5,
                                offset: Offset(0, 2))
                          ],
                        border: Border.all(color: Colors.black.withOpacity(.1), width: 1)
                      ),
                      child: Stack(
                        children: <Widget>[
                          Transform(
                            transform: Matrix4.translationValues(
                                (constraints.maxWidth / 2) - 55, -35, 0),
                            child: InkWell(
                              onTap: () =>
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Preview())),
                              child: Hero(
                                tag: 'preview',
                                child: ClipOval(
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage: AssetImage('assets/images/talknaija/profile.jpeg'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Column(
                              children: <Widget>[
                                _buildItem(context, 'Name', 'Jude Francis'),
                                _buildItem(
                                    context, 'Email', 'judecodes@yahoo.com'),
                                _buildItem(context, 'Username', 'judecodes'),
                                _buildItem(context, 'Occupation',
                                    'Software Developer'),
                                SizedBox(height: 10,)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

class Preview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: null,
              icon: Icon(Icons.save)
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Hero(
          tag: 'preview',
          child: Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  'assets/images/talknaija/profile.jpeg', fit: BoxFit.cover,),
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: -5,
                        blurRadius: 15,
                        offset: Offset(0, 20))
                  ])
          ),
        ),
      ),
    );
  }
}


//DecoratedBox(
//decoration: BoxDecoration(
//shape: BoxShape.rectangle,
//image: DecorationImage(
//image: AssetImage(
//'assets/images/talknaija/profile.jpeg'),
//fit: BoxFit.cover,
//),
//boxShadow: [
//BoxShadow(
//color: Colors.black.withOpacity(.3),
//spreadRadius: -5,
//blurRadius: 15,
//offset: Offset(0, 20))
//]),
//)


//Container(
//width: 70,
//height: 70,
//child: DecoratedBox(
//decoration: BoxDecoration(
//shape: BoxShape.circle,
//image: DecorationImage(
//image: AssetImage(
//'assets/images/talknaija/profile.jpeg'),
//fit: BoxFit.cover,
//),
//boxShadow: [
//BoxShadow(
//color: Colors.black.withOpacity(.3),
//spreadRadius: -5,
//blurRadius: 15,
//offset: Offset(0, 20))
//]),
//),
//)