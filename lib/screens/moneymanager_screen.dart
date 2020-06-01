import 'package:couplemanager/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/reusable_card_content.dart';
import '../components/reusable_card.dart';

class MoneyManagerScreen extends StatelessWidget {
  static String id = 'moneymanager_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,

      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: kPrimaryColor.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: Icon(Icons.arrow_back,size: 35,),),
                        Expanded(
                          flex: 4,
                            child: SvgPicture.asset("assets/icons/money.svg")
                      ),
                        Expanded(child: Icon(Icons.list,size: 35,),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                    child: Row()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
