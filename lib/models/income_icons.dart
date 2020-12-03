import 'dart:collection';
import 'package:couplemanager/components/components_moneymanager/add_icon.dart';
import 'package:flutter/material.dart';
import '../models/expenses_icons.dart';

class IncomeIcons extends ChangeNotifier{

  // Icons-List
  List<AddIcon> _addIncomeIconList =[
    AddIcon(iconID: 59021 ,iconName: "Lohn Kaddy"),
    AddIcon(iconID: 59021 ,iconName: "Lohn Peter"),
    AddIcon(iconID: 61667 ,iconName: "Geschenke"),
    AddIcon(iconID: 61756 ,iconName: "BAFÖG"),
    AddIcon(iconID: 59013 ,iconName: "Sonstiges"),
    //AddIcon(iconID: 57669 ,iconName: "Hinzufügen")
  ];

  List<AddIcon> get addDataList{
    return _addIncomeIconList ;
  }

  int get iconsCount{
    return _addIncomeIconList.length;
  }

  void addEntry(AddIcon addIcon){
    _addIncomeIconList.add(addIcon);
    notifyListeners();
  }

  void deleteEntry(AddIcon addIcon){
    _addIncomeIconList.remove(addIcon);
    notifyListeners();
  }




}