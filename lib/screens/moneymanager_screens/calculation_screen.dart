import 'package:couplemanager/components/components_moneymanager/add_icon.dart';
import 'package:flutter/material.dart';

class CalculationScreen extends StatelessWidget {
  CalculationScreen({this.addIcon});
  final AddIcon addIcon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
      child:Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height/1.5,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: 'hero${addIcon.name}',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          addIcon,

                          ListTile(
                            leading: Icon(Icons.monetization_on),
                            title: TextField(decoration: InputDecoration(
                              hintText: "Money"
                            ),),
                          ),

                          ListTile(
                            leading: Icon(Icons.calendar_today),
                            title: TextField(decoration: InputDecoration(
                                hintText: "Date"
                            ),),
                          ),

                          ListTile(
                            leading: Icon(Icons.person),
                            title: TextField(decoration: InputDecoration(
                                hintText: "Person"
                            ),),
                          )


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    ),
      );
  }
}
