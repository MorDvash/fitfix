import 'package:fitfix/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  var user = UserModel(userName: '', email: '', token: '', imageUrl: '');

  bool get isAuth {
    if (user.token != '') {
      return true;
    }
    return false;
  }

  void insertUserInfo(UserModel userInfo) {
    user = userInfo;
    notifyListeners();
  }

  void signOut() {
    user.token = '';
    user.email = '';
    user.userName = '';
    user.imageUrl = '';
    notifyListeners();
  }
}
