import 'package:flutter/material.dart';

class LoadingCircular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinearProgressIndicator(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
