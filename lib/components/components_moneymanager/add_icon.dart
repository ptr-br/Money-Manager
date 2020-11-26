import 'package:couplemanager/constants.dart';
import 'package:flutter/material.dart';


class AddIcon extends StatelessWidget {

  AddIcon({@required this.iconID,@ required this.iconName}){
    isSelected =false;
    this.iconID = iconID;
    this.iconName = iconName;
  }

  AddIcon.withSelected( this.iconID, this.iconName, @required this.isSelected){
    this.iconID=iconID;
    this.iconName=iconName;
    this.isSelected=isSelected;
  }


  int iconID;
  String iconName;
  bool isSelected;
  Color fillColourSelected = kPrimaryColor.withOpacity(0.5);
  Color fillColourNotSelected = kDarkColor.withOpacity(0.2);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RawMaterialButton(
              constraints: BoxConstraints.tight(Size(46, 46)),
             onPressed: null,
              elevation: 2,
              fillColor: isSelected ? fillColourSelected : fillColourNotSelected,
              focusColor: Colors.red,
              highlightColor: Colors.green ,
              shape: CircleBorder(),
              child: Icon(IconData(iconID, fontFamily: 'MaterialIcons'))),

          Text(iconName,
          style: kaddIconTextstyle),
        ],
      ),
    );
  }
}
