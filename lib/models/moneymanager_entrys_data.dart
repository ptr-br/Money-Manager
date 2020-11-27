import 'dart:collection';
import 'package:flutter/material.dart';
import 'moneymanager_entry.dart';
import '../database/database.dart';


class EntryDataProvider with ChangeNotifier{

  EntryDataProvider(){
    _selectedDate = DateTime.now();
  }

  DateTime _selectedDate;
 DBProvider dbHelper = DBProvider.instnace;
 List<Entry> _entrys=[];



// Getters
 DateTime get selectedDate => _selectedDate;


 Future<List> get entryData {
    return  dbHelper.getAllEntrys();
 }

  Future <double>  get getExpense async{
    _entrys = await dbHelper.getEntrysByMonth(_selectedDate.toString());
    double income = 0;
    for (Entry entry in _entrys){
      income += entry.expense;
    }
    return income;

  }


// int get entryCount{
//   print('Rewrite this method');
//   return 0;
// }


 // Setters
 void  setSelectedDate(DateTime date){
   _selectedDate = date;
   notifyListeners();
 }




  // Methods
 Future<List> entryDataByMonth(String date) {
   return  dbHelper.getEntrysByMonth(date);
 }

 void  deleteEntry(String date){
  dbHelper.deleteEntry(date);
  notifyListeners();
}

 void addEntry(Entry entry){
    dbHelper.newEntry(entry);
   notifyListeners();
 }




}