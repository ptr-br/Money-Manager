import 'package:couplemanager/models/income_icons.dart';
import 'package:flutter/material.dart';
import 'package:couplemanager/constants.dart';
import 'package:provider/provider.dart';
import 'package:couplemanager/screens/moneymanager_screens/moneymanager_screen.dart';
import 'package:couplemanager/models/entry.dart';
import 'package:couplemanager/models/entrys_data.dart';
import 'package:couplemanager/components/components_moneymanager/add_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:couplemanager/utils.dart';





enum Character {Peter, Kaddy}

class AddingScreen extends StatefulWidget {
  static String id = "adding_screen";
  AddingScreen({this.iconID, this.iconName, @required this.type});

  final String type;
  final int iconID;
  final String iconName;
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  _AddingScreen createState() => _AddingScreen();
}

class _AddingScreen extends State<AddingScreen> {
  final FocusNode _moneyFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  final parser = buildParser();



  // values
  double _money;
  String _description;
  DateTime _dateTime;
  Character _character = Character.Peter;

  @override
  Widget build(BuildContext context) {
    // call method to get acess to locale date
    initializeDateFormatting();



    _fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

    return ChangeNotifierProvider(
      create: (context) => IncomeIcons(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Übersicht"),
          backgroundColor: kDarkColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SafeArea(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  child: Form(
                    key: AddingScreen._formKey,
                    child: Column(
                      children: <Widget>[


                       Hero(
                            transitionOnUserGestures: true,
                            tag: 'hero${widget.iconName}',
                            child: GestureDetector(
                              onTap: (){
                                AddingScreen._formKey.currentState.save();

                                Provider.of<EntryDataProvider>(context, listen: false).updateExpenses();
                                Provider.of<EntryDataProvider>(context, listen: false).updateIncome();

                                Entry entry = new Entry(
                                    timestamp: DateTime.now().toString(),
                                    type: widget.type,
                                    cardName: widget.iconName,
                                    icon: widget.iconID,
                                    expense: _money,
                                    description: _description,
                                    date:_dateTime==null ? DateTime.now().toString() : _dateTime.toString(),
                                    person: _character.toString()

                                );
                                Provider.of<EntryDataProvider>(context, listen: false).addEntry(entry);

                                print(_dateTime);


                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) => MoneyManagerScreen.createFromAddingScreen(
                                        (widget.type=="expense")?true:false,
                                        (_dateTime)==null ? DateTime.now() : _dateTime)),
                                        (route) => false);
                              },
                              child: Material(
                                type: MaterialType.transparency,
                                child: Container(child: AddIcon.withSelected(widget.iconID, widget.iconName,true,(widget.type=="expense")?true:false)),
                              ),
                            ),
                        ),


                        // differnet ListTiles for things like Date, ampount of money etc.
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          child: ListTile(
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
                                        print('DateTime here');
                                        print(_dateTime);
                                      });
                                    });
                                  }
                              ),
                            ),
                        ),


                          Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: ListTile(

                              leading: Icon(Icons.monetization_on),
                              title: TextFormField(
                              
                                decoration: InputDecoration(hintText: "Betrag in €",),
                                focusNode: _moneyFocus,
                                autofocus: kAutoFocusKeyboard,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,

                                onFieldSubmitted: (term) {
                                  _fieldFocusChange(context, _moneyFocus, _descriptionFocus);
                                },

                                // set , and . equal to denote the border between euro and cents
                                onSaved: (value) {
                                  if (value.contains(',')){
                                    List values = value.split(',');
                                    value = values.join('.');
                                  }
                                  try{

                                    final result =parser.parse(value);
                                    
                                    if (result.isSuccess)
                                      _money =  result.value.toDouble();
                                    else
                                      _money = double.parse(value);
                                  } catch(e){
                                    _money = 0;
                                  }
                                },

                               ),
                             ),
                          ),


                           Card(
                             color: Colors.white,
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                             child: ListTile(
                              leading: Icon(Icons.description),
                              title: TextFormField(
                                decoration: InputDecoration(hintText: "Beschreibung"),
                                focusNode: _descriptionFocus,
                                onSaved: (value) {
                                  _description = value;
                                },
                              ),
                          ),
                           ),


                           Card(
                             color:Colors.white,
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                             child: ListTile(
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
                           ),
                        SizedBox(
                      height: 60
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ),
        ),
      ),
    );
  }
}
