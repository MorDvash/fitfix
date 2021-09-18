class UserModel {
  String userName;
  String email;
  String token;
  String imageUrl;
  int userType;

  UserModel(
      {required this.userName,
      required this.email,
      required this.token,
      required this.imageUrl,
      this.userType = 0});
}
