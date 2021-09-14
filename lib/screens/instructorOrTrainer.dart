import 'package:flutter/material.dart';

class InstructorOrTrainerScreen extends StatelessWidget {
  const InstructorOrTrainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text('מתאמן')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: Text('מאמן')),
          ],
        ),
      ),
    );
  }
}
