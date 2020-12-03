import 'package:couplemanager/constants.dart';
import 'package:couplemanager/models/entry.dart';
import 'package:couplemanager/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/entrys_data.dart';
import 'package:couplemanager/screens/moneymanager_screens/moneymanager_screen.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {@required this.entry});

  Entry entry;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 10,
            width: 10,
          ),
          RawMaterialButton(
              constraints: BoxConstraints.tight(Size(38, 38)),
              onLongPress: (() {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Eintrag Löschen"),
                      content: Text("Das Löschen eines Eintrags entfernt diesen aus der Datenbank"),
                      actions: [
                        MaterialButton(
                            child: Text("Abbrechen"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: kTextMediumColor,
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        MaterialButton(
                          child: Text("Löschen"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: kFABcloseColor,
                          onPressed: () {
                            Provider.of<EntryDataProvider>(context, listen: false).deleteEntry(entry.date);
                            Navigator.pushNamedAndRemoveUntil(
                                context, MoneyManagerScreen.id, (
                                Route<dynamic> route) => false);
                          },
                        )
                      ],
                    );
                  },
                );
              }),
              elevation: 5,
              fillColor: kPrimaryColor.withOpacity(0.5),
              shape: CircleBorder(),
              child:   Icon(IconData(entry.icon, fontFamily: 'MaterialIcons'))),
          Expanded(

            child: GestureDetector(
              onLongPress:  (() {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
//
//
//                    AlertDialog(
//                        content: ScrollConfiguration(
//                        behavior: CustomScrollBehavior(),
//                    child: SingleChildScrollView(
//                    scrollDirection: Axis.vertical,
//                    child: Stack(
//                    children: <Widget>[
//                    Align(

                    return AlertDialog(
                      title: Text("${entry.cardName}"),
                        content: ScrollConfiguration(
                        behavior: CustomScrollBehavior(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Stack(
                            children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/2.5,
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        child: Column(
                                          children: <Widget>[
                                            RawMaterialButton(
                                              constraints: BoxConstraints.tight(Size(50, 50)),
                                               elevation: 5,
                                               fillColor: kPrimaryColor.withOpacity(0.5),
                                               shape: CircleBorder(),
                                               child:   Icon(IconData(entry.icon, fontFamily: 'MaterialIcons'),
                                               ),
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.calendar_today),
                                              title: Text("${entry.date.split(" ")[0]}"),
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.monetization_on),
                                              title: Text("${entry.expense}€"),
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.description),
                                              title: Text("${entry.description}"),
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.person),
                                              title: Text("${entry.person.split(".")[1]}"),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),



                            ],
                          ),
                        ),
                      ),


                      actions: [
                        MaterialButton(
                            child: Text("Zurück"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: kTextMediumColor,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                        ),
                      ],
                    );
                  },
                );
              }),
                child: Text('${entry.cardName}', style: kStyleCardName)),
          ),
          Expanded(
            child: Text(
              "${entry.expense}",
              style: kStyleExpenses,
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
        ],
      ),
    );
  }
}
