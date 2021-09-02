import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
              child: Divider(
                color: Colors.white,
                height: 50,
              )),
        ),
        Text(
          "OR",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 15.0, right: 10.0),
              child: Divider(
                color: Colors.white,
                height: 50,
              )),
        ),
      ],
    );
  }
}
