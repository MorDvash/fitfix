import 'package:flutter/material.dart';

class InstructorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.train),
            title: Text('some test'),
            subtitle: Text('Some sub text'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('buy tickets'),
              ),
              const SizedBox(
                width: 8,
              ),
              TextButton(onPressed: () {}, child: Text('listen'))
            ],
          )
        ],
      ),
    );
  }
}
