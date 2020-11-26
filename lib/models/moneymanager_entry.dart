import 'package:couplemanager/screens/moneymanager_screens/calculation_screen.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../database/database.dart';

Entry entryfromJson(String str) => Entry.fromMap(json.decode(str));
String entryToJson(Entry data) => json.encode(data.toMap());

class Entry{
  Entry({@required this.cardName, @required this.icon, this.description,
          @required this.expense,@required this.date, this.person, @required this.timestamp});

  DBProvider dbHelper = DBProvider.instnace;

  final int icon;
  final String cardName;
  final String date;
  final String person;
  final String timestamp;
  String description;
  double expense;


  factory Entry.fromMap(Map<String, dynamic> json) => Entry(
    timestamp: json["timestamp"],
    date: json["date"],
    person: json["person"],
    cardName: json["cardName"],
    icon: json["icon"],
    description: json["description"],
    expense: json["expense"],
  );

  Map<String, dynamic> toMap() => {
    "timestamp": timestamp.toString(),
    "date": date.toString(),
    "person": person,
    "cardName": cardName,
    "icon": icon,
    "description": description,
    "expense": expense,
  };

}