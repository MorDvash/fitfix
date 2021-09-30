import 'package:fitfix/widgets/drawer.dart';
import 'package:flutter/material.dart';

class FitnessInstructorsScreen extends StatelessWidget {
  static const routeName = 'fitnessInstructorsScreen';
  const FitnessInstructorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('מאמני כושר אישיים'),
          actions: [],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'חיפוש כללי',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.waves),
                    label: Text('סינון')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
