import 'package:fitfix/provider/instructorsProvider.dart';
import 'package:fitfix/widgets/drawer.dart';
import 'package:fitfix/widgets/instructorCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FitnessInstructorsScreen extends StatefulWidget {
  static const routeName = 'fitnessInstructorsScreen';
  const FitnessInstructorsScreen({Key? key}) : super(key: key);

  @override
  _FitnessInstructorsScreenState createState() =>
      _FitnessInstructorsScreenState();
}

class _FitnessInstructorsScreenState extends State<FitnessInstructorsScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<InstructorsProvider>(context).getInstructorsData();
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final instructorList =
        Provider.of<InstructorsProvider>(context).instructors;
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
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: instructorList.length,
                itemBuilder: (context, index) {
                  return InstructorCard();
                }),
          ],
        ),
      ),
    );
  }
}
