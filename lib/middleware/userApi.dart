import 'dart:convert';

import 'package:fitfix/models/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<void> saveUserDetails(String userName, String uid, String email,
      String imageUrl, String token) async {
    var url = Uri.parse('http://localhost:4000/user/signUp');
    try {
      await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "uid": uid,
            "email": email,
            "name": userName,
            "imageUrl": imageUrl,
          }));
    } catch (error) {
      print(error);
    }
  }

  static Future<UserModel> getUserDetails(String token) async {
    var url = Uri.parse('http://localhost:4000/user/signIn');
    try {
      var res = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      var user = jsonDecode(res.body);
      return UserModel(
          userName: user['name'],
          email: user['email'],
          token: token,
          imageUrl: user['imageUrl'],
          userType: user['userType']);
    } catch (error) {
      print(error);
      throw error;
    }
  }

  static Future<void> updateUserTypeToDB(token, userType) async {
    var url = Uri.parse('http://localhost:4000/user/updateUserType');
    try {
      await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'userType': userType,
        }),
      );
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
