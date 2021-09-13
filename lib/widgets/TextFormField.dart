import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class TextForm extends StatefulWidget {
  final String placeholder;
  final String variable;
  final Function onSaved;
  final MultiValidator validator;
  final bool hideText;
  final GlobalKey keyField;
  final bool isFocus;
  final TextInputType keyType;

  TextForm(
      {required this.placeholder,
      required this.variable,
      required this.onSaved,
      required this.validator,
      required this.hideText,
      required this.keyField,
      required this.isFocus,
      required this.keyType});

  @override
  _TextFormState createState() => _TextFormState();
}

@override
class _TextFormState extends State<TextForm> {
  var _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.keyField,
      obscureText: widget.hideText ? _passwordVisible : false,
      autofocus: widget.isFocus,
      keyboardType: widget.keyType,
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
