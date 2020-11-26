import 'dart:collection';
import 'package:couplemanager/components/components_moneymanager/add_icon.dart';
import 'package:flutter/material.dart';
import '../models/moneymanager_add_data.dart';

class AddData extends ChangeNotifier{

  // Icons-List
  List<AddIcon> _addIconList =[
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
    return _addIconList ;
  }

  int get iconsCount{
    return _addIconList.length;
  }

  void addEntry(AddIcon addIcon){
    _addIconList.add(addIcon);
    notifyListeners();
  }

  void deleteEntry(AddIcon addIcon){
    _addIconList.remove(addIcon);
    notifyListeners();
  }




}