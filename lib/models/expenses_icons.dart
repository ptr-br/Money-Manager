import 'dart:collection';
import 'package:couplemanager/components/components_moneymanager/add_icon.dart';
import 'package:flutter/material.dart';
import '../models/expenses_icons.dart';

class ExpensesIcons extends ChangeNotifier{

  // Icons-List
  List<AddIcon> _addExpenesesIconList =[
    AddIcon(iconID: 59168 ,iconName: "Lebensmittel"),
    AddIcon(iconID: 61001 ,iconName: "Ausgehen"),
    AddIcon(iconID: 62619 ,iconName: "Kleidung"),
    AddIcon(iconID: 59067 ,iconName: "Transport"),
    AddIcon(iconID: 59901 ,iconName: "Hygiene"),
    AddIcon(iconID: 58870 ,iconName: "Bildung"),
    AddIcon(iconID: 59335 ,iconName: "Haushalt"),
    AddIcon(iconID: 62788 ,iconName: "Wohnung"),
    AddIcon(iconID: 59161 ,iconName: "Sonstiges"),
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