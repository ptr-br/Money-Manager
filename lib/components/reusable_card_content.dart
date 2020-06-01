import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardContent extends StatelessWidget {

  CardContent({this.iconName});

  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: SvgPicture.asset("assets/icons/$iconName.svg"),
    );
  }
}
