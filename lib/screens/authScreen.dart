import 'package:fitfix/middleware/FirebaseApi.dart';
import 'package:fitfix/widgets/TextFormField.dart';
import 'package:fitfix/widgets/roundedElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = 'authScreen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formEmailKey = GlobalKey<FormFieldState>();
  final _formUserNameKey = GlobalKey<FormFieldState>();
  final _formPasswordKey = GlobalKey<FormFieldState>();
  var _email = '';
  var _userName = '';
  var _password = '';

  void onSaved(value, variable) {
    switch (variable) {
      case 'userName':
        {
          _userName = value;
        }
        break;
      case 'email':
        {
          _email = value;
        }
        break;
      case 'password':
        {
          _password = value;
        }
        break;
    }
  }

  Future<void> register(title) async {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      if (title == 'הרשמה') {
        FireBaseApi.signUpWithEmail(_email, _password, _userName);
      } else {
        FireBaseApi.signInWithEmail(_email, _password);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _passwordValidator = MultiValidator([
      RequiredValidator(errorText: 'Password is required'),
      MinLengthValidator(7,
          errorText: 'Password must be at least 7 digits long'),
    ]);
    final _emailValidator = MultiValidator([
      RequiredValidator(errorText: 'Email is required'),
      EmailValidator(errorText: 'Enter a valid email address'),
    ]);
    final _usernameValidator = MultiValidator([
      RequiredValidator(errorText: 'Username is required'),
      MinLengthValidator(2,
          errorText: 'Username must be at least 2 digits long'),
    ]);
    final title = ModalRoute.of(context)!.settings.arguments as String;
    var label = title == 'הרשמה' ? 'הרשם' : 'התחבר';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextForm(
                    placeholder: 'דוא״ל',
                    variable: 'email',
                    onSaved: onSaved,
                    validator: _emailValidator,
                    hideText: false,
                    keyField: _formEmailKey,
                    isFocus: true,
                    keyType: TextInputType.emailAddress),
                SizedBox(height: 10),
                if (title == 'הרשמה')
                  TextForm(
                      placeholder: 'שם משתמש',
                      variable: 'userName',
                      onSaved: onSaved,
                      validator: _usernameValidator,
                      hideText: false,
                      keyField: _formUserNameKey,
                      isFocus: false,
                      keyType: TextInputType.name),
                SizedBox(height: 10),
                TextForm(
                    placeholder: 'סיסמא',
                    variable: 'password',
                    onSaved: onSaved,
                    validator: _passwordValidator,
                    hideText: true,
                    keyField: _formPasswordKey,
                    isFocus: false,
                    keyType: TextInputType.numberWithOptions(
                        signed: true, decimal: true)),
                SizedBox(height: 30),
                RoundedElevatedButton(label, register, title),
                SizedBox(height: 10),
                if (title == 'התחברות')
                  InkWell(
                    onTap: () {
                      bool isValid = _formEmailKey.currentState!.validate();
                      if (isValid) {
                        FireBaseApi.resetPassword(_email);
                      }
                    },
                    child: new Text(
                      '?שכחת סיססמא',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
