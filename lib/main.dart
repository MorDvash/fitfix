import 'package:firebase_core/firebase_core.dart';
import 'package:fitfix/provider/userProvider.dart';
import 'package:fitfix/screens/authScreen.dart';
import 'package:fitfix/screens/fitnessInstructors.dart';
import 'package:fitfix/screens/homeScreen.dart';
import 'package:fitfix/screens/instructorOrTrainer.dart';
import 'package:fitfix/screens/userHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
          create: (context) => UserProvider(),
        ),
      ],
      child: Consumer<UserProvider>(
        builder: (context, userProvider, _) => MaterialApp(
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('he', ''),
          ],
          locale: Locale("he", ""),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: userProvider.isAuth
              ? userProvider.user.userType != 0
                  ? userProvider.user.userType == 1
                      ? FitnessInstructorsScreen()
                      : UserHomeScreen()
                  : InstructorOrTrainerScreen()
              : HomeScreen(),
          routes: {
            AuthScreen.routeName: (context) => AuthScreen(),
            UserHomeScreen.routeName: (context) => UserHomeScreen(),
            FitnessInstructorsScreen.routeName: (context) =>
                FitnessInstructorsScreen(),
          },
        ),
      ),
    );
  }
}
