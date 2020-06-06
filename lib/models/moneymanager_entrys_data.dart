import 'dart:collection';
import 'package:flutter/material.dart';
import 'moneymanager_entry.dart';


class EntryData extends ChangeNotifier{

 List<Entry> _entrys =[Entry(description: "kleine Beschreibung", icon:Icon(Icons.ac_unit),cardName:"Schneearbeiten", expense: 12.50),Entry(description: "kleine Beschreibung", icon:Icon(Icons.card_giftcard),cardName:"Auto", expense: 145.50), Entry(description: "kleine Beschreibung", icon:Icon(Icons.security),cardName:"Versicherung", expense: 7864.50)];

 UnmodifiableListView<Entry> get entryData{
   return UnmodifiableListView(_entrys);
 }

 int get entryCount{
   return _entrys.length;
 }

 void addEntry(Entry entry){
   _entrys.add(entry);
   notifyListeners();
 }

 void deleteEntry(Entry entry){
   _entrys.remove(entry);
   notifyListeners();
 }


}