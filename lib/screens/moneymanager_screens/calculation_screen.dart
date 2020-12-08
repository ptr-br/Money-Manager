//import 'package:couplemanager/components/components_moneymanager/add_icon.dart';
//import 'package:couplemanager/constants.dart';
//import 'package:couplemanager/models/entry.dart';
//import 'package:couplemanager/models/entrys_data.dart';
//import 'package:couplemanager/screens/moneymanager_screens/moneymanager_screen.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';
//import '../../utils.dart';
//import 'package:intl/intl.dart';
//import 'package:intl/date_symbol_data_local.dart';
//
//enum Character {Peter, Kaddy}
//
//class CalculationScreen extends StatefulWidget {
//  CalculationScreen({this.iconID,this.iconName, @required this.type});
//
//  final String type;
//  final int iconID;
//  final String iconName;
//  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//
//  @override
//  _CalculationScreenState createState() => _CalculationScreenState();
//}
//
//
//
//
//
//class _CalculationScreenState extends State<CalculationScreen> {
//
//  final FocusNode _moneyFocus = FocusNode();
//  final FocusNode _descriptionFocus = FocusNode();
//  Character _character = Character.Peter;
//  DateTime _dateTime;
//
//  @override
//  Widget build(BuildContext context) {
//
//    // call method to get acess to locale date
//    initializeDateFormatting();
//
//    // values
//    double _money;
//    String _date;
//    String _person;
//    String _description;
//
//
//
//    _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
//      currentFocus.unfocus();
//      FocusScope.of(context).requestFocus(nextFocus);
//    }
//
//      return AlertDialog(
//        content: ScrollConfiguration(
//          behavior: CustomScrollBehavior(),
//          child: SingleChildScrollView(
//            scrollDirection: Axis.vertical,
//            child: Stack(
//              children: <Widget>[
//                Align(
//                  alignment: Alignment.center,
//                  child: Container(
//                    height: MediaQuery
//                        .of(context)
//                        .size
//                        .height / 2,
//                    width: MediaQuery
//                        .of(context)
//                        .size
//                        .width,
//
//                    child: Container(
//                      child: Form(
//                        key: CalculationScreen._formKey,
//                        child: Column(
//                          children: <Widget>[
//
//                            Hero(
//                              transitionOnUserGestures: true,
//                              tag: 'hero${widget.iconName}',
//                              child: Material(
//                                type: MaterialType.transparency,
//                                child: Container(child: AddIcon.withSelected(widget.iconID, widget.iconName,true)),
//                              ),
//
//                              // prevent hero from overfloating
//                              flightShuttleBuilder: (BuildContext flightContext,
//                                  Animation<double> animation,
//                                  HeroFlightDirection flightDirection,
//                                  BuildContext fromHeroContext,
//                                  BuildContext toHeroContext,) {
//                                return SingleChildScrollView(
//                                  child: fromHeroContext.widget,
//                                );
//                              },
//                            ),
//
//
//                            // differnet ListTiles for things like Date, ampount of money etc.
//                            ListTile(
//                              leading: Icon(Icons.calendar_today),
//                              title: GestureDetector(
//                                  child: Text(_dateTime==null ? DateFormat.yMd('de').format((DateTime.now())).toString():DateFormat.yMd('de').format((_dateTime)).toString()),
//                                onTap:(){
//                                    showDatePicker(
//                                      locale:Locale('de', 'DE'),
//                                        context: context,
//                                        initialDate: DateTime.now(),
//                                        firstDate: DateTime(2000),
//                                        lastDate: DateTime(2100)
//                                    ).then((date){
//                                      setState(() {
//                                        _dateTime = date;
//                                      });
//                                    });
//                                }
//                              ),
//                            ),
//
//
//                            ListTile(
//                              leading: Icon(Icons.monetization_on),
//                              title: TextFormField(
//                                decoration: InputDecoration(hintText: "Betrag in €"),
//                                focusNode: _moneyFocus,
//                                autofocus: kAutoFocusKeyboard,
//                                textInputAction: TextInputAction.next,
//                                keyboardType: TextInputType.number,
//
//                                onFieldSubmitted: (term) {
//                                  _fieldFocusChange(context, _moneyFocus, _descriptionFocus);
//                                },
//
//                                // set , and . equal to denote the border between euro and cents
//                                onSaved: (value) {
//                                  if (value.contains(',')){
//                                    print(value);
//                                    List values = value.split(',');
//                                    value = values.join('.');
//                                    print(value);
//                                  };
//                                  try{
//                                    _money = double.parse(value);
//                                  } catch(e){
//                                    print(e);
//                                    _money = 0;
//                                  }
//
//
//                                },
//                              ),
//                            ),
//
//
//                            ListTile(
//                              leading: Icon(Icons.description),
//                              title: TextFormField(
//                                decoration: InputDecoration(hintText: "Beschreibung"),
//                                focusNode: _descriptionFocus,
//                                onSaved: (value) {
//                                  _description = value;
//                                },
//                              ),
//                            ),
//
//
//                            ListTile(
//                              leading: Icon(Icons.person),
//                              title: Row(
//                                children: <Widget>[
//
//                                  Radio(
//                                    focusColor: kPrimaryColor,
//                                    activeColor: kPrimaryColor,
//                                    groupValue: _character,
//                                    value: Character.Peter,
//                                    onChanged: (Character value){
//                                      setState(() {
//                                        _character= value;
//                                      });
//                                    },
//                                  ),
//                                  Text('Peter'),
//
//                                  Radio(
//                                    focusColor: kPrimaryColor,
//                                    activeColor: kPrimaryColor,
//                                    groupValue: _character,
//                                    value:  Character.Kaddy,
//                                    onChanged: (Character value){
//                                      setState(() {
//                                        _character= value;
//                                      });
//                                    },
//                                  ),
//                                  Text('Kaddy')
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//        actions: <Widget>[
//
//          MaterialButton(
//              child: Text("Abbrechen"),
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(20)),
//              color: kFABcloseColor,
//              onPressed: () {
//                Navigator.pop(context);
//              }),
//
//          MaterialButton(
//              child: Text("Hinzufügen"),
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(20)),
//              color: kPrimaryColor,
//              onPressed: () {
//                CalculationScreen._formKey.currentState.save();
//
//                Provider.of<EntryDataProvider>(context, listen: false).updateExpenses();
//                Provider.of<EntryDataProvider>(context, listen: false).updateIncome();
//
//                Entry entry = new Entry(
//                    timestamp: DateTime.now().toString(),
//                    type: widget.type,
//                    cardName: widget.iconName,
//                    icon: widget.iconID,
//                    expense: _money,
//                    description: _description,
//                    date:_dateTime==null ? DateTime.now().toString() : _dateTime.toString(),
//                    person: _character.toString()
//
//                );
//                Provider.of<EntryDataProvider>(context, listen: false).addEntry(entry);
//                Navigator.pushNamedAndRemoveUntil(
//                    context, MoneyManagerScreen.id, (
//                    Route<dynamic> route) => false);
//              }),
//        ],
//      );
//    }
//}
//
