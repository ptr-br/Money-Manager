import 'package:couplemanager/constants.dart';
import 'package:couplemanager/models/entrys_data.dart';
import 'package:couplemanager/screens/moneymanager_screens/expenses_screen.dart';
import 'package:couplemanager/screens/moneymanager_screens/income_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/components_moneymanager/moneymanager_headercard.dart';
import '../../components/components_moneymanager/expenses_list.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';



class MoneyManagerScreen extends StatefulWidget {

  // Default Constructor
  MoneyManagerScreen(){
    this.isExpense= true;
    DateTime dateNow = DateTime.now();
    this.selectedDate = dateNow;
  }

  // Constructor when coming from adding_screen
  MoneyManagerScreen.createFromAddingScreen(this.isExpense, this.selectedDate){
    this.isExpense = isExpense;
    this.selectedDate= selectedDate;
  }


  bool isExpense;
  DateTime selectedDate;
  static String id = 'moneymanager_screen';

  @override
  _MoneyManagerScreenState createState() => _MoneyManagerScreenState();
}

class _MoneyManagerScreenState extends State<MoneyManagerScreen> {


  //ScrollController scrollController;
  bool dialVisible = true;




  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EntryDataProvider>(context, listen: false).setSelectedDate(widget.selectedDate);
      Provider.of<EntryDataProvider>(context, listen: false).updateExpenses();
      Provider.of<EntryDataProvider>(context, listen: false).updateIncome();
    });



    // scrollController code from here can be found at the bottom of this file under 1)


  }

  void setIsExpense(String name){

    if(name=="Ausgaben" && widget.isExpense==false ||name=="Einnahmen" && widget.isExpense==true){
      widget.isExpense = !widget.isExpense;
      setState(() {
      });
    }
  }


  void newDate(DateTime date){
    var entryProvider = Provider.of<EntryDataProvider>(context,listen: false);
    entryProvider.setSelectedDate(date);
    widget.selectedDate = date;

  }


  Future<List> _getEntrySnapForMonth(bool isExpense) async{
    var entryProvider = Provider.of<EntryDataProvider>(context,listen: false);
    var data = await entryProvider.entryDataByMonth(widget.selectedDate.toString(),isExpense);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var entryProvider = Provider.of<EntryDataProvider>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: buildSpeedDail(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: buildBody(),
      //bottomNavigationBar: buildBottomNavigationBar(),
      );
  }


  // Widget-build functions
  SafeArea buildBody(){
    return SafeArea(
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
                  child: MoneyManagerHeaderCard(newDate:newDate, selectedDate: widget.selectedDate, setIsExpense:setIsExpense ),
                ),
              ),
              Expanded(flex: 200, child: ExpensesList(_getEntrySnapForMonth(widget.isExpense))),
              // old One using scrollController :Expanded(flex: 200, child: ExpensesList(scrollController: scrollController)),
            ],
          ),
        ),
      ),
    );
  }
// TODO ADD FUNCTIONALITIES FOR BOTTOM NAVIGATION BAR
  BottomNavigationBar buildBottomNavigationBar(){
    return BottomNavigationBar(
      selectedItemColor: (widget.isExpense) ?kFABcloseColor: kPrimaryColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.list), title: Text('Übersicht')),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), title: Text('Kategorien')),
        BottomNavigationBarItem(
            icon: Icon(Icons.assessment), title: Text('Statistik')),
      ],
    );

}

  SpeedDial buildSpeedDail(){
    return SpeedDial(
      overlayColor: Colors.white,
      visible: dialVisible,
      closeManually: false,
      backgroundColor: kDarkColor,
      elevation: 5.0,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      curve: Curves.bounceIn,
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      foregroundColor: Colors.white,
      shape: CircleBorder(),
      children: [

        SpeedDialChild(
          child: Icon(Icons.remove),
          backgroundColor: kFABcloseColor,
          label: 'Ausgaben hinzufügen',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: (){
            Navigator.pushNamed(context, ExpensesScreen.id );
          },
        ),

        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: kPrimaryColor,
          label: 'Einkommen hinzufügen',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: (){
             Navigator.pushNamed(context, IncomeScreen.id );
          },
        ),

      ],
    );
  }
}