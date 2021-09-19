import 'package:fitfix/middleware/FirebaseApi.dart';
import 'package:fitfix/provider/userProvider.dart';
import 'package:fitfix/widgets/TextFormField.dart';
import 'package:fitfix/widgets/roundedElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

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
        await Provider.of<UserProvider>(context, listen: false)
            .signUpWithEmailProvider(_email, _password, _userName);
      } else {
        await Provider.of<UserProvider>(context, listen: false)
            .signInWithEmailProvider(_email, _password);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _passwordValidator = MultiValidator([
      RequiredValidator(errorText: 'אנא מלא שדה זה'),
      MinLengthValidator(7, errorText: 'סיסמא קצרה מידי'),
    ]);
    final _emailValidator = MultiValidator([
      RequiredValidator(errorText: 'אנא מלא שדה זה'),
      EmailValidator(errorText: 'דוא״ל לא תקין'),
    ]);
    final _usernameValidator = MultiValidator([
      RequiredValidator(errorText: 'אנא מלא שדה זה'),
      MinLengthValidator(2, errorText: 'שם משתמש קצר מידי'),
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
