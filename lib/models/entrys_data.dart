import 'dart:collection';
import 'package:flutter/material.dart';
import 'entry.dart';
import '../database/database.dart';


class EntryDataProvider with ChangeNotifier{

  EntryDataProvider(){
    _selectedDate = DateTime.now();
  }


  double _expenses = 0;
  double _income  = 0;


  DateTime _selectedDate;
  DBProvider dbHelper = DBProvider.instnace;
  List<Entry> _entrysIncome=[];
  List<Entry> _entrysExpenses=[];




// Getters
 DateTime get selectedDate => _selectedDate;

 double get expenses => _expenses;
 double get income => _income;


 Future<List> get entryData {
    return  dbHelper.getAllEntrys();
 }

  void updateExpenses() async{
    _entrysExpenses = await dbHelper.getEntrysByMonth(_selectedDate.toString(),true);
    double expenses = 0;
    for (Entry entry in _entrysExpenses){
      expenses += entry.expense;
    }
    _expenses= expenses;
    notifyListeners();
  }

  void updateIncome() async{
    _entrysIncome = await dbHelper.getEntrysByMonth(_selectedDate.toString(),false);
    double income = 0;
    for (Entry entry in _entrysIncome){
      income += entry.expense;
    }
      _income = income;

      notifyListeners();
  }

 // Setters
 void  setSelectedDate(DateTime date){
   _selectedDate = date;
   notifyListeners();
 }

  // Methods
 Future<List> entryDataByMonth(String date, bool isExpense) {
   return  dbHelper.getEntrysByMonth(date, isExpense);
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