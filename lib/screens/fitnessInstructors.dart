import 'package:fitfix/widgets/drawer.dart';
import 'package:flutter/material.dart';

class FitnessInstructorsScreen extends StatelessWidget {
  static const routeName = 'fitnessInstructorsScreen';
  const FitnessInstructorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('מאמני כושר אישיים'),
        actions: [],
      ),
      drawer: MainDrawer(),
    );
  }
}
