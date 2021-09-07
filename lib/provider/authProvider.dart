import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  Future<void> signUpWithEmail(
      String email, String password, String userName) async {
    var url = Uri.parse('http://localhost:4000/user/signUp');
    try {
      UserCredential userInfo = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final res = await http.post(
        url,
        body: json.encode(
          {
            'userName': userName,
            'uid': userInfo.user!.uid,
            'email': email,
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
