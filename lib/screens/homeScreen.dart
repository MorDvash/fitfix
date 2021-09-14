import 'package:fitfix/middleware/FirebaseApi.dart';
import 'package:fitfix/provider/userProvider.dart';
import 'package:fitfix/screens/authScreen.dart';
import 'package:fitfix/widgets/roundedElevatedButton.dart';
import 'package:fitfix/widgets/textDivider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void navigateToSignUp(BuildContext context) {
    Navigator.of(context).pushNamed(AuthScreen.routeName, arguments: 'הרשמה');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/homePic.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text.rich(
                  TextSpan(
                      text: 'Fit',
                      style: TextStyle(fontSize: 80, color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Fix',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.blue),
                        ),
                      ]),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButtons('images/facebook.png'),
                    SocialMediaButtons('images/google.png'),
                    SocialMediaButtons('images/email.png'),
                  ],
                ),
                TextDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedElevatedButton(
                      'הרשמה',
                      navigateToSignUp,
                      context,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaButtons extends StatelessWidget {
  final String imagePath;

  SocialMediaButtons(this.imagePath);

  Future<void> signWithSocial(BuildContext context) async {
    if (imagePath.contains('google')) {
      var userinfo = await FireBaseApi.signInWithGoogle();
      Provider.of<UserProvider>(context, listen: false)
          .insertUserInfo(userinfo);
    } else if (imagePath.contains('facebook')) {
      var userinfo = await FireBaseApi.signInWithFacebook();
      Provider.of<UserProvider>(context, listen: false)
          .insertUserInfo(userinfo);
    } else if (imagePath.contains('email')) {
      Navigator.of(context)
          .pushNamed(AuthScreen.routeName, arguments: 'התחברות');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        signWithSocial(context);
      },
      child: Image.asset(imagePath),
    );
  }
}
