import 'dart:collection';
import 'package:couplemanager/components/components_moneymanager/add_icon.dart';
import 'package:flutter/material.dart';
import '../models/moneymanager_add_data.dart';

class AddData extends ChangeNotifier{

  // Icons-List
  List<AddIcon> _addIconList =[
    AddIcon(icon: Icon(Icons.shopping_cart) ,name: "Lebensmittel"),
    AddIcon(icon: Icon(Icons.local_dining) ,name: "Ausgehen"),
    AddIcon(icon: Icon(Icons.accessibility_new) ,name: "Kleidung"),
    AddIcon(icon: Icon(Icons.directions_car) ,name: "Transport"),
    AddIcon(icon: Icon(Icons.brush) ,name: "Hygiene"),
    AddIcon(icon: Icon(Icons.book) ,name: "Bildung"),
    AddIcon(icon: Icon(Icons.wc) ,name: "Haushalt"),
    AddIcon(icon: Icon(Icons.home) ,name: "Wohnung"),
    AddIcon(icon: Icon(Icons.attach_file) ,name: "Sonstiges"),
    AddIcon(icon: Icon(Icons.add) ,name: "Hinzufügen")
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