import 'dart:convert';

import 'package:http/http.dart' as http;

class UserApi {
  static saveUserDetails(String userName, String uid, String email) async {
    var url = Uri.parse('http://localhost:4000/user/signUp');
    try {
      await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "uid": uid,
            "email": email,
            "name": userName,
          }));
    } catch (error) {
      print(error);
    }
  }
}
