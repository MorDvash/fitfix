import 'package:fitfix/models/FiltersList.dart';
import 'package:fitfix/widgets/filterAction.dart';
import 'package:flutter/material.dart';

class InstructorFilters extends StatefulWidget {
  const InstructorFilters({Key? key}) : super(key: key);

  @override
  _InstructorFiltersState createState() => _InstructorFiltersState();
}

class _InstructorFiltersState extends State<InstructorFilters> {
  @override
  Widget build(BuildContext context) {
    var filters = [
      new Filter(
          filterName: 'סנן לפי', filterList: ['דרוג', 'רלוונטי', 'עדכני']),
      new Filter(filterName: 'התמחות', filterList: [
        'מאמן אישי',
        'אימון כוח',
        'אחר',
        'פיתוח גןף',
        'hiit',
        'core'
      ]),
      new Filter(filterName: 'מיקום', filterList: ['תל אביב', 'בת ים', 'יפו']),
      new Filter(
          filterName: 'מיקום האימון', filterList: ['בחוץ', 'במכון', 'סטודיו']),
      new Filter(filterName: 'מין', filterList: ['זכר', 'נקבה', 'אחר']),
    ];
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.7,
      builder: (_, controller) {
        return Container(
          child: ListView.builder(
            controller: controller,
            itemCount: filters.length,
            itemBuilder: (_, i) =>
                FilterAction(filters[i].filterName, filters[i].filterList),
          ),
        );
      },
    );
  }
}
