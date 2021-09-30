import 'package:fitfix/middleware/FirebaseApi.dart';
import 'package:fitfix/middleware/userApi.dart';
import 'package:fitfix/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  var user =
      UserModel(userName: '', email: '', token: '', imageUrl: '', userType: 0);

  bool get isAuth {
    if (user.token != '') {
      return true;
    }
    return false;
  }

  Future<void> signWithGoogleProvider() async {
    var userInfo = await FireBaseApi.signInWithGoogle();
    if (userInfo['isNewUser']) {
      await UserApi.saveUserDetails(
          userInfo['userData'].userName,
          userInfo['userData'].email,
          userInfo['userData'].imageUrl,
          userInfo['userData'].token,
          userInfo['userData'].userType);
      insertUserInfo(userInfo['userData']);
    } else {
      var userData = await UserApi.getUserDetails(userInfo['userData'].token);
      insertUserInfo(userData);
    }
  }

  Future<void> signWithFacebookProvider() async {
    var userInfo = await FireBaseApi.signInWithFacebook();
    if (userInfo['isNewUser']) {
      await UserApi.saveUserDetails(
          userInfo['userData'].userName,
          userInfo['userData'].email,
          userInfo['userData'].imageUrl,
          userInfo['userData'].token,
          userInfo['userData'].userType);
      insertUserInfo(userInfo['userData']);
    } else {
      var userData = await UserApi.getUserDetails(userInfo['userData'].token);
      insertUserInfo(userData);
    }
  }

  Future<void> signUpWithEmailProvider(
      String email, String password, String userName) async {
    try {
      var userInfo =
          await FireBaseApi.signUpWithEmail(email, password, userName);
      await UserApi.saveUserDetails(
          userInfo['userData'].userName,
          userInfo['userData'].email,
          userInfo['userData'].imageUrl,
          userInfo['userData'].token,
          userInfo['userData'].userType);
      insertUserInfo(userInfo['userData']);
    } catch (error) {
      print(error);
    }
  }

  Future<void> signInWithEmailProvider(String email, String password) async {
    try {
      var token = await FireBaseApi.signInWithEmail(email, password);
      var userInfo = await UserApi.getUserDetails(token);
      insertUserInfo(userInfo);
    } catch (error) {
      throw error;
    }
  }

  void insertUserInfo(UserModel userInfo) {
    user = userInfo;
    notifyListeners();
  }

  void updateUserType(int userType) {
    UserApi.updateUserTypeToDB(user.token, userType);
  }

  void signOut() {
    user.token = '';
    user.email = '';
    user.userName = '';
    user.imageUrl = '';
    user.userType = 0;
    notifyListeners();
  }
}
