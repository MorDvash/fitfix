import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfix/middleware/userApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    } catch (error) {
      print(error);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      var googleUser = await GoogleSignIn().signIn();
      var googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var userInfo =
          await FirebaseAuth.instance.signInWithCredential(credential);
      var uid = FirebaseAuth.instance.currentUser!.uid;
      if (userInfo.additionalUserInfo!.isNewUser) {
        await UserApi.saveUserDetails(userInfo.user!.displayName as String, uid,
            userInfo.user!.email as String);
        print('registerd');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
