import 'package:fitfix/middleware/FirebaseApi.dart';
import 'package:fitfix/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('mor dvash is auth'),
          ),
          body: Column(
            children: [
              Center(
                child: Text('is auth'),
              ),
              ElevatedButton(
                  onPressed: () {
                    FireBaseApi.signOutFromFireBase();
                    Provider.of<UserProvider>(context, listen: false).signOut();
                  },
                  child: Text('Log Out'))
            ],
          )),
    );
  }
}
