import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfix/middleware/userApi.dart';
import 'package:fitfix/models/user.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseApi {
  static Future<UserModel> signUpWithEmail(
      String email, String password, String userName) async {
    try {
      UserCredential userInfo = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return saveUser(userInfo, userName);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      throw error;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  static Future<UserModel> signInWithEmail(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      String token = await FirebaseAuth.instance.currentUser!.getIdToken();
      return await UserApi.getUserDetails(token);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      throw e.code;
    } catch (error) {
      throw error;
    }
  }

  static Future<UserModel> signInWithGoogle() async {
    try {
      var googleUser = await GoogleSignIn().signIn();
      var googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var userInfo =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return saveUser(userInfo, '');
    } catch (error) {
      print(error);
      throw error;
    }
  }

  static Future<UserModel> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userInfo =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return saveUser(userInfo, '');
      } else {
        throw 'שגיאה - אנא נסה מאוחר יותר';
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  static Future<UserModel> saveUser(userInfo, displayName) async {
    String userName = userInfo.user.displayName != null
        ? userInfo.user.displayName
        : displayName;
    String email = userInfo.user.email;
    String photoURL =
        userInfo.user.photoURL != null ? userInfo.user.photoURL : '';
    String uid = userInfo.user.uid;
    String token = await FirebaseAuth.instance.currentUser!.getIdToken();
    if (userInfo.additionalUserInfo!.isNewUser) {
      await UserApi.saveUserDetails(userName, uid, email, photoURL, token);
    }
    return UserModel(
        userName: userName,
        email: email,
        token: token,
        imageUrl: photoURL,
        userType: 0);
  }

  static void resetPassword(String email) {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (error) {}
  }

  static Future<void> signOutFromFireBase() async {
    await FirebaseAuth.instance.signOut();
  }
}
