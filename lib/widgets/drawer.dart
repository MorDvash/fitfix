import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('שפה'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('פרופיל'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('הגדרות'),
          ),
        ],
      ),
    );
  }
}
