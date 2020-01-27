import 'package:experiments/create/model.dart';
import 'package:experiments/create/provider.dart';
import 'package:flutter/material.dart';

class Preferences extends StatelessWidget {

  final prefsBloc;

  const Preferences({Key key, this.prefsBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Preferences'),
      ),
      body: Container(
        child: StreamBuilder<IPreferences>(
          stream: prefsBloc.preferencesStream,
          builder: (context, snapshot) {
            return snapshot.hasData ? ListView(
              children: [
                SizedBox(height: 20),
                ListTile(
                  title: Text('Night Mode'),
                  leading: Icon(Icons.wb_sunny),
                  trailing: Switch(
                    value: snapshot.data.nightMode,
                    onChanged: (value) {
//                      prefsBloc.updatePreferences();
                      prefsBloc.updatePreferences(IPreferences(nightMode: value,horizontalCardView:snapshot.data.horizontalCardView));
                    },
                  ),
                ),
                ListTile(
                  title: Text('Horizontal Cards'),
                  leading: Icon(Icons.border_vertical),
                  trailing: Switch(
                    value: snapshot.data.horizontalCardView,
                    onChanged: (value) {
                      prefsBloc.updatePreferences(IPreferences(nightMode: snapshot.data.nightMode,horizontalCardView: value));
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
            ) : Center(child: CircularProgressIndicator());
          }
        ),
      ),
    );
  }
}
