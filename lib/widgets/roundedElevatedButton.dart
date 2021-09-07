import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  final String label;
  final Function onClick;
  final dynamic variableFunction;

  RoundedElevatedButton(this.label, this.onClick, this.variableFunction);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () =>
          {variableFunction != null ? onClick(variableFunction) : onClick()},
    );
  }
}
