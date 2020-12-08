import 'dart:collection';
import 'dart:ui';
import 'package:couplemanager/components/components_moneymanager/add_icon.dart';
import 'package:flutter/material.dart';
import '../models/expenses_icons.dart';

class ExpensesIcons extends ChangeNotifier{

  // Icons-List
  List<AddIcon> _addExpenesesIconList =[
    AddIcon(iconID: 59168 ,iconName: "Lebensmittel", isExpense: true),
    AddIcon(iconID: 61001 ,iconName: "Ausgehen", isExpense: true),
    AddIcon(iconID: 62619 ,iconName: "Kleidung", isExpense: true),
    AddIcon(iconID: 59067 ,iconName: "Transport", isExpense: true),
    AddIcon(iconID: 59901 ,iconName: "Hygiene", isExpense: true),
    AddIcon(iconID: 58870 ,iconName: "Bildung", isExpense: true),
    AddIcon(iconID: 59335 ,iconName: "Haushalt", isExpense: true),
    AddIcon(iconID: 62788 ,iconName: "Wohnung", isExpense: true),
    AddIcon(iconID: 59161 ,iconName: "Sonstiges", isExpense: true),
   //AddIcon(iconID: 57669 ,iconName: "Hinzufügen")
  ];

  List<AddIcon> get addDataList{
    return _addExpenesesIconList ;
  }

  int get iconsCount{
    return _addExpenesesIconList.length;
  }

  void addEntry(AddIcon addIcon){
    _addExpenesesIconList.add(addIcon);
    notifyListeners();
  }

  void deleteEntry(AddIcon addIcon){
    _addExpenesesIconList.remove(addIcon);
    notifyListeners();
  }




}