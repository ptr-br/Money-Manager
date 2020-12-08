import 'package:couplemanager/constants.dart';
import 'package:flutter/material.dart';


class AddIcon extends StatelessWidget {

  AddIcon({@required this.iconID,@ required this.iconName, @required this.isExpense}){
    isSelected =false;
    this.isExpense= isExpense;
    this.iconID = iconID;
    this.iconName = iconName;
  }

  AddIcon.withSelected( this.iconID, this.iconName, @required this.isSelected, this.isExpense){
    this.iconID=iconID;
    this.iconName=iconName;
    this.isSelected=isSelected;
    this.isExpense = isExpense;
  }

  bool isExpense = false;
  int iconID;
  String iconName;
  bool isSelected;
  Color fillColourSelectedIsExpense = kFABcloseColor.withOpacity(0.3);
  Color fillColourSelectedNoExpense = kPrimaryColor.withOpacity(0.5);
  Color fillColourNotSelected = kDarkColor.withOpacity(0.2);



  Color getFillColor(){
      if(isSelected && isExpense){
          return fillColourSelectedIsExpense;
        }else if(isSelected && !isExpense){
        return fillColourSelectedNoExpense;
              }else{
        return fillColourNotSelected;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RawMaterialButton(
              constraints: BoxConstraints.tight(Size(46, 46)),
             onPressed: null,
              elevation: 2,
              fillColor: getFillColor(),

              shape: CircleBorder(),
              child: Icon(IconData(iconID, fontFamily: 'MaterialIcons'))),

          Text(iconName,
          style: kaddIconTextstyle),
        ],
      ),
    );
  }
}
