import 'package:flutter/material.dart';


class Entry {
  Entry({@required this.cardName, @required this.icon, this.description, this.timeStamp, @required this.expense});

  final Icon icon;
  final String cardName;
  String description;
  final DateTime timeStamp;
  double expense;

}