import 'dart:collection';
import 'package:flutter/material.dart';
import 'moneymanager_entry.dart';
import '../database/database.dart';


class EntryData extends ChangeNotifier{



 DBProvider dbHelper = DBProvider.instnace;
 List<Entry> _entrys=[];



 Future<List> get entryData {
    return  dbHelper.getAllEntrys();
 }

 int get entryCount{
   print('Rewrite this method');
   return 0;
 }

 void  deleteEntry(String date){
  dbHelper.deleteEntry(date);
  notifyListeners();
}



 void addEntry(Entry entry){
    dbHelper.newEntry(entry);
   notifyListeners();
 }

 Future <double> get getExpense async{
   _entrys = await dbHelper.getAllEntrys();
   double income = 0;
   for (Entry entry in _entrys){
     income += entry.expense;
   }
   return income;

 }


}