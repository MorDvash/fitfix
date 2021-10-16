import 'package:flutter/material.dart';

class FilterAction extends StatefulWidget {
  final String filterName;
  final List filterList;

  FilterAction(this.filterName, this.filterList);

  @override
  _FilterActionState createState() => _FilterActionState();
}

class _FilterActionState extends State<FilterAction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.filterName,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: Text('ערוך'))
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
