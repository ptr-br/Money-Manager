import 'package:couplemanager/components/components_moneymanager/add_icon.dart';
import 'package:couplemanager/constants.dart';
import 'package:couplemanager/models/moneymanager_entry.dart';
import 'package:couplemanager/models/moneymanager_entrys_data.dart';
import 'package:couplemanager/screens/moneymanager_screens/moneymanager_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../utils.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

enum Character { Peter, Kaddy }

class CalculationScreen extends StatefulWidget {
  CalculationScreen({this.iconID,this.iconName});

  final int iconID;
  final String iconName;
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}





class _CalculationScreenState extends State<CalculationScreen> {

  final FocusNode _moneyFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  Character _character = Character.Peter;
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {

    // call method to get acess to locale date
    initializeDateFormatting();

    // values
    double _money;
    String _date;
    String _person;
    String _description;



    _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

      return AlertDialog(
        content: ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,

                    child: Container(
                      child: Form(
                        key: CalculationScreen._formKey,
                        child: Column(
                          children: <Widget>[

                            Hero(
                              transitionOnUserGestures: true,
                              tag: 'hero${widget.iconName}',
                              child: Material(
                                type: MaterialType.transparency,
                                child: Container(child: AddIcon(iconID: widget.iconID, iconName: widget.iconName)),
                              ),

                              // prevent hero from overfloating
                              flightShuttleBuilder: (BuildContext flightContext,
                                  Animation<double> animation,
                                  HeroFlightDirection flightDirection,
                                  BuildContext fromHeroContext,
                                  BuildContext toHeroContext,) {
                                return SingleChildScrollView(
                                  child: fromHeroContext.widget,
                                );
                              },
                            ),


                            // differnet ListTiles for things like Date, ampount of money etc.
                            ListTile(
                              leading: Icon(Icons.calendar_today),
                              title: GestureDetector(
                                  child: Text(_dateTime==null ? DateFormat.yMd('de').format((DateTime.now())).toString():DateFormat.yMd('de').format((_dateTime)).toString()),
                                onTap:(){
                                    showDatePicker(
                                      locale:Locale('de', 'DE'),
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100)
                                    ).then((date){
                                      setState(() {
                                        _dateTime = date;
                                      });
                                    });
                                }
                              ),
                            ),


                            ListTile(
                              leading: Icon(Icons.monetization_on),
                              title: TextFormField(
                                decoration: InputDecoration(hintText: "Money"),
                                focusNode: _moneyFocus,
                                autofocus: kAutoFocusKeyboard,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,

                                onFieldSubmitted: (term) {
                                  _fieldFocusChange(context, _moneyFocus, _descriptionFocus);
                                },


                                onSaved: (value) {
                                  _money = double.tryParse(value);
                                },
                              ),
                            ),


                            ListTile(
                              leading: Icon(Icons.description),
                              title: TextFormField(
                                decoration: InputDecoration(hintText: "Description"),
                                focusNode: _descriptionFocus,
                                onSaved: (value) {
                                  _description = value;
                                },
                              ),
                            ),


                            ListTile(
                              leading: Icon(Icons.person),
                              title: Row(
                                children: <Widget>[

                                  Radio(
                                    focusColor: kPrimaryColor,
                                    activeColor: kPrimaryColor,
                                    groupValue: _character,
                                    value: Character.Peter,
                                    onChanged: (Character value){
                                      setState(() {
                                        _character= value;
                                      });
                                    },
                                  ),
                                  Text('Peter'),

                                  Radio(
                                    focusColor: kPrimaryColor,
                                    activeColor: kPrimaryColor,
                                    groupValue: _character,
                                    value:  Character.Kaddy,
                                    onChanged: (Character value){
                                      setState(() {
                                        _character= value;
                                      });
                                    },
                                  ),
                                  Text('Kaddy')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[

          MaterialButton(
              child: Text("Cancel"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: kFABcloseColor,
              onPressed: () {
                Navigator.pop(context);
              }),

          MaterialButton(
              child: Text("Add"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: kPrimaryColor,
              onPressed: () {
                CalculationScreen._formKey.currentState.save();

                Entry entry = new Entry(cardName: widget.iconName,
                    icon: widget.iconID,
                    expense: _money,
                    description: _description,
                    date:_dateTime==null ? DateTime.now() : _dateTime,
                  person: _character.toString()

                );
                Provider.of<EntryData>(context, listen: false).addEntry(entry);
                Navigator.pushNamedAndRemoveUntil(
                    context, MoneyManagerScreen.id, (
                    Route<dynamic> route) => false);
              }),
        ],
      );
    }
}
