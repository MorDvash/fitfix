import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  final String userName;
  final String email;
  final String token;
  final String imageUrl;

  UserProvider(
      {required this.userName,
      required this.email,
      required this.token,
      required this.imageUrl});

  static void userSignIn(
      String email, String userName, String token, String imageUrl) {
    UserProvider(
        userName: userName, email: email, token: token, imageUrl: imageUrl);
  }
}
