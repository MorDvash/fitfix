import 'dart:convert';

import 'package:http/http.dart' as http;

class UserApi {
  static saveUserDetails(String userName, String uid, String email) async {
    var url = Uri.parse('http://localhost:4000/user/signUp');
    try {
      await http.post(
        url,
        body: json.encode(
          {
            'userName': userName,
            'uid': uid,
            'email': email,
          },
        ),
      );
    } catch (error) {
      print(error);
    }
  }
}
