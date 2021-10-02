import 'package:fitfix/models/instructor.dart';
import 'package:flutter/material.dart';

class InstructorCard extends StatelessWidget {
  final Instructor _instructor;

  InstructorCard(this._instructor);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(_instructor.imagePlace),
            ),
            title: Text(_instructor.businessName),
            subtitle: Text(_instructor.bio),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.message),
                label: const Text('צור קשר'),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
