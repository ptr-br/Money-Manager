import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../database/database.dart';

Entry entryfromJson(String str) => Entry.fromMap(json.decode(str));
String entryToJson(Entry data) => json.encode(data.toMap());

class Entry{
  Entry({
          @required this.cardName, @required this.icon, this.description,
          @required this.expense,@required this.date, this.person, @required this.timestamp,
          @required this.type
      });

  DBProvider dbHelper = DBProvider.instnace;


  final String type;
  final int icon;
  final String cardName;
  final String date;
  final String person;
  final String timestamp;
  String description;
  double expense;


  factory Entry.fromMap(Map<String, dynamic> json) => Entry(
    timestamp: json["timestamp"],
    type: json["type"] ,
    date: json["date"],
    person: json["person"],
    cardName: json["cardName"],
    icon: json["icon"],
    description: json["description"],
    expense: json["expense"],
  );

  Map<String, dynamic> toMap() => {
    "timestamp": timestamp.toString(),
    "type": type,
    "date": date.toString(),
    "person": person,
    "cardName": cardName,
    "icon": icon,
    "description": description,
    "expense": expense,
  };

}