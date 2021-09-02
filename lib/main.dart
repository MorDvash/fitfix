import 'package:firebase_core/firebase_core.dart';
import 'package:fitfix/screens/authScrren.dart';
import 'package:fitfix/screens/homeScreen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        AuthScreen.routeName: (context) => AuthScreen(),
      },
    );
  }
}
