import 'package:flutter/material.dart';

class InstructorFilters extends StatefulWidget {
  const InstructorFilters({Key? key}) : super(key: key);

  @override
  _InstructorFiltersState createState() => _InstructorFiltersState();
}

class _InstructorFiltersState extends State<InstructorFilters> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.7,
      builder: (_, controller) {
        return Container(
          color: Colors.blue[500],
          child: ListView.builder(
            controller: controller,
            itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
          ),
        );
      },
    );
  }
}
