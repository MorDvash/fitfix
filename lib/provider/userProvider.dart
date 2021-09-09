import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfix/middleware/userApi.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  Future<void> signUpWithEmail(
      String email, String password, String userName) async {
    try {
      UserCredential userInfo = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await UserApi.saveUserDetails(userName, userInfo.user!.uid, email);
      notifyListeners();
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
