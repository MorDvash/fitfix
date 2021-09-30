import 'package:fitfix/provider/userProvider.dart';
import 'package:fitfix/screens/fitnessInstructors.dart';
import 'package:fitfix/screens/userHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstructorOrTrainerScreen extends StatelessWidget {
  const InstructorOrTrainerScreen({Key? key}) : super(key: key);

  void chooseUserType(BuildContext context, int userType) {
    Provider.of<UserProvider>(context, listen: false).updateUserType(userType);
    if (userType == 1) {
      Navigator.of(context).pushNamed(FitnessInstructorsScreen.routeName);
    } else {
      Navigator.of(context).pushNamed(UserHomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  chooseUserType(context, 1);
                },
                child: Text('מתאמן')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  chooseUserType(context, 2);
                },
                child: Text('מאמן')),
          ],
        ),
      ),
    );
  }
}
