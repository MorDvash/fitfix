import 'package:fitfix/provider/userProvider.dart';
import 'package:fitfix/widgets/roundedElevatedButton.dart';
import 'package:flutter/material.dart';
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
                TextForm('Email Address', 'email', onSaved),
                SizedBox(height: 10),
                if (title == 'Sign Up')
                  TextForm('Username', 'userName', onSaved),
                SizedBox(height: 10),
                TextForm('Password', 'password', onSaved),
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

  TextForm(this.placeholder, this.variable, this.onSaved);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.placeholder,
        border: OutlineInputBorder(),
      ),
      onSaved: (value) => widget.onSaved(value, widget.variable),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.placeholder}';
        }
        return null;
      },
    );
  }
}
