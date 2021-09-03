import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('mor dvash is auth'),
        ),
        body: Center(
          child: Text('is auth'),
        ),
      ),
    );
  }
}
