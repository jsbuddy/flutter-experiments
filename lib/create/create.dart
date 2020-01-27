import 'package:experiments/create/bloc.dart';
import 'package:experiments/create/pages/preferences.dart';
import 'package:experiments/create/theme.dart';
import 'package:experiments/create/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:experiments/create/provider.dart';
import 'package:experiments/create/model.dart';
import 'package:flutter/services.dart';

class FlutterCreate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FlutterCreateState();
  }
}

class FlutterCreateState extends State<FlutterCreate> {
  @override
  Widget build(BuildContext context) {
    return PreferencesProvider(
      bloc: PreferencesBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Create',
        theme: ITheme.light,
        home: new Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefsBloc = PreferencesProvider.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: FlutterLogo(
                size: 25,
              ),
              onPressed: () {}),
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text('Preferences'),
                    value: 'prefs',
                  ),
                  PopupMenuItem(child: Text('About'), value: 'about'),
                  PopupMenuDivider(),
                  PopupMenuItem(child: Text('Exit'), value: 'exit'),
                ];
              },
              onSelected: (selected) {
                switch (selected) {
                  case 'prefs':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Preferences(prefsBloc: prefsBloc),
                      ),
                    );
                    break;
                  case 'exit':
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    break;
                  default:
                    break;
                }
              },
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: StreamBuilder<IPreferences>(
            stream: prefsBloc.preferencesStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.horizontalCardView
                    ? Container(
                        child: PageView(
                          controller: PageController(
                            viewportFraction: .95,
                          ),
                          pageSnapping: true,
                          children: items
                              .map((item) => ICard.vertical(
                                  title: item.title,
                                  body: item.body,
                                  gradient: item.gradient,
                                  context: context))
                              .toList(),
                        ),
                      )
                    : ListView(
                        children: items
                            .map((item) => ICard.horizontal(
                                title: item.title,
                                body: item.body,
                                gradient: item.gradient,
                                context: context))
                            .toList(),
                      );
              } else {
                return Center(
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        )));
              }
            }),
//          body: Container(
//            child: PageView(
//              controller: PageController(
//                viewportFraction: .95,
//              ),
//              pageSnapping: true,
//              children: items
//                  .map((item) => ICard.vertical(
//                      title: item.title,
//                      body: item.body,
//                      gradient: item.gradient,
//                      context: context))
//                  .toList(),
//            ),
      ),
    );
  }
}
