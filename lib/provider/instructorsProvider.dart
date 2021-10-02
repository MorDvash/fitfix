import 'package:fitfix/demoData.dart';
import 'package:fitfix/models/instructor.dart';
import 'package:flutter/material.dart';

class InstructorsProvider with ChangeNotifier {
  List<Instructor> _instructors = [];

  List<Instructor> get instructors {
    return [..._instructors];
  }

  void getInstructorsData() {
    _instructors = DUMMY_INSTRUCTOR;
    print(_instructors);
  }
}
