import 'package:couplemanager/constants.dart';
import 'package:flutter/material.dart';


class AddIcon extends StatelessWidget {

  AddIcon({this.icon,this.name});
  final Icon icon;
  final String name;
  bool isSelected = false;
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
              child: icon),

          Text(name,
          style: kaddIconTextstyle),
        ],
      ),
    );
  }
}
