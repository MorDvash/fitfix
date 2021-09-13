import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfix/middleware/userApi.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseApi {
  static Future<void> signUpWithEmail(
      String email, String password, String userName) async {
    try {
      UserCredential userInfo = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await UserApi.saveUserDetails(userName, userInfo.user!.uid, email);
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

  static Future<void> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static Future<void> signInWithGoogle() async {
    try {
      var googleUser = await GoogleSignIn().signIn();
      var googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var userInfo =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userInfo.additionalUserInfo!.isNewUser) {
        await UserApi.saveUserDetails(userInfo.user!.displayName as String,
            userInfo.user!.uid, userInfo.user!.email as String);
      }
    } catch (error) {
      print(error);
    }
  }

  static Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userInfo =
            await FirebaseAuth.instance.signInWithCredential(credential);
        if (userInfo.additionalUserInfo!.isNewUser) {
          await UserApi.saveUserDetails(userInfo.user!.displayName as String,
              userInfo.user!.uid, userInfo.user!.email as String);
        }
      }
      return null;
    } catch (error) {
      print(error);
    }
  }

  static void resetPassword(String email) {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (error) {}
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
