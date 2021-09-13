import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitfix/provider/userProvider.dart';
import 'package:fitfix/screens/authScreen.dart';
import 'package:fitfix/screens/homeScreen.dart';
import 'package:fitfix/screens/userHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              UserProvider(userName: '', email: '', token: '', imageUrl: ''),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnapShot) {
            // if (userSnapShot.connectionState == ConnectionState.waiting) {
            //   return LoadingCircular();
            // }
            if (userSnapShot.hasData) {
              return UserHomeScreen();
            }
            return HomeScreen();
          },
        ),
        routes: {
          AuthScreen.routeName: (context) => AuthScreen(),
        },
      ),
    );
  }
}
