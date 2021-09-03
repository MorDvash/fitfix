import 'package:fitfix/widgets/roundedElevatedButton.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = 'authScreen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  Future<void> signUp() async {
    // bool isValid = _formKey.currentState!.validate();
    // if(isValid) {
    //   Provider.of<AuthProvider>(context).signUpWithEmail(email, password)
    // }
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
                TextForm('Email Address'),
                SizedBox(height: 10),
                if (title == 'Sign Up') TextForm('Username'),
                SizedBox(height: 10),
                TextForm('Password'),
                SizedBox(height: 30),
                RoundedElevatedButton(title, signUp),
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

  TextForm(this.placeholder);

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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.placeholder}';
        }
        return null;
      },
    );
  }
}
