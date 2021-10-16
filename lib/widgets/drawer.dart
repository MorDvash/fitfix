import 'package:fitfix/middleware/FirebaseApi.dart';
import 'package:fitfix/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  void _logOut(context) async {
    await FireBaseApi.signOutFromFireBase();
    Provider.of<UserProvider>(context, listen: false).signOut();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).user;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
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
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('התנתק'),
            onTap: () => {_logOut(context)},
          ),
        ],
      ),
    );
  }
}
