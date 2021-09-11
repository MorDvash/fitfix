import 'package:fitfix/provider/userProvider.dart';
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

  void register(title) {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      if (title == 'Sign Up') {
        Provider.of<AuthProvider>(context, listen: false)
            .signUpWithEmail(_email, _password, _userName);
      } else {
        Provider.of<AuthProvider>(context, listen: false)
            .signInWithEmail(_email, _password);
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
                    'Email Address', 'email', onSaved, _emailValidator, false),
                SizedBox(height: 10),
                if (title == 'Sign Up')
                  TextForm('Username', 'userName', onSaved, _usernameValidator,
                      false),
                SizedBox(height: 10),
                TextForm(
                    'Password', 'password', onSaved, _passwordValidator, true),
                SizedBox(height: 30),
                RoundedElevatedButton(title, register, title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextForm extends StatefulWidget {
  final String placeholder;
  final String variable;
  final Function onSaved;
  final MultiValidator validator;
  final bool hideText;

  TextForm(this.placeholder, this.variable, this.onSaved, this.validator,
      this.hideText);

  @override
  _TextFormState createState() => _TextFormState();
}

@override
class _TextFormState extends State<TextForm> {
  var _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _passwordVisible,
      decoration: InputDecoration(
        labelText: widget.placeholder,
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            widget.hideText
                ? _passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off
                : null,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      onSaved: (value) => widget.onSaved(value, widget.variable),
      validator: widget.validator,
    );
  }
}
