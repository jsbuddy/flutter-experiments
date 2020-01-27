import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: <Widget>[
          SettingsList(
              'Account',
              [
                ListTile(
                  title: Text('Email'),
                  subtitle: Text('judecodes@yahoo.com'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 22),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Change Password'),
                  subtitle: Text('Never changed'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 22),
                  onTap: () {},
                ),
              ],
              null),
          SettingsList(
              'More',
              [
                ListTile(
                  title: Text('Night Mode'),
                  trailing: Switch(value: false, onChanged: (value) {}),
                  contentPadding: EdgeInsets.symmetric(horizontal: 22),
                ),
                ListTile(
                  title: Text('Clear cache'),
                  subtitle: Text('Remove all cached feeds'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 22),
                  onTap: () {},
                ),
              ],
              null),
        ],
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: Text('Settings'),
        elevation: 0,
      );
}

class SettingsList extends StatelessWidget {
  final String _title;
  final List<Widget> _items;
  final VoidCallback _onEdit;

  SettingsList(this._title, this._items, this._onEdit);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22)
              .copyWith(top: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _title,
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 15),
              ),
              (_onEdit != null)
                  ? InkWell(
                      borderRadius: BorderRadius.circular(100),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.edit, size: 14),
                            SizedBox(width: 5),
                            Text('Edit')
                          ],
                        ),
                      ),
                      onTap: _onEdit,
                    )
                  : Text('')
            ],
          ),
        ),
        ListBody(
          children: _items.map((f) => f).toList(),
        ),
      ],
    );
  }
}
