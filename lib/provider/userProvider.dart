import 'package:fitfix/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  User? user;
  // final String userName;
  // final String email;
  // final String token;
  // final String imageUrl;
  //
  // UserProvider(
  //     {required this.userName,
  //     required this.email,
  //     required this.token,
  //     required this.imageUrl});

  void userSignIn(
      String email, String userName, String token, String imageUrl) {
    user!.email = email;
    user!.userName = userName;
    user!.token = token;
    user!.imageUrl = imageUrl;
  }
}
