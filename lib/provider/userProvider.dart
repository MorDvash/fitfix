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
