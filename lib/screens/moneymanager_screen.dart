import 'package:couplemanager/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/components_moneymanager/moneymanager_headercard.dart';
import '../components/components_moneymanager/expenses_list.dart';
import '../models/moneymanager_entrys_data.dart';
import 'package:provider/provider.dart';


class MoneyManagerScreen extends StatelessWidget {
  static String id = 'moneymanager_screen';
  int expanses = 1250;
  int income = 1500;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 5,
          backgroundColor: kPrimaryColor,
          onPressed: (){
          },

          child: Icon(Icons.add,size: 35,),

        ),
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 20,
                      child: Container(
                        //
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Expanded(child: Icon(Icons.arrow_back,size: 30,color: kTextMediumColor),),
                            Expanded(
                                flex: 4,
                                child:
                                    SvgPicture.asset("assets/icons/money.svg")),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        height: 220,
                        width: double.maxFinite,
                        child: MoneyManagerHeaderCard(
                            income: income, expanses: expanses),
                      ),
                    ),
                    Expanded(flex: 200, child: ExpensesList()),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.list), title: Text('Expenses')),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), title: Text('Stats')),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
  }
}
