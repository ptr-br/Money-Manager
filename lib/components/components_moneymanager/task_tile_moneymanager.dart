import 'package:couplemanager/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.expense,
      this.timeStamp,
      this.icon,
      this.cardName,
      this.description});

  final Icon icon;
  final String cardName;
  String description;
  final DateTime timeStamp;
  double expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 10,
            width: 10,
          ),
          RawMaterialButton(
              constraints: BoxConstraints.tight(Size(38, 38)),
              onPressed: null,
              elevation: 5,
              fillColor: kPrimaryColor.withOpacity(0.5),
              shape: CircleBorder(),
              child: icon),
          Expanded(
            child: Text(
              '$cardName',
              style: kStyleCardName),
          ),
          Expanded(
            child: Text(
              "$expense",
              style: kStyleExpenses,
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
        ],
      ),
    );
  }
}
