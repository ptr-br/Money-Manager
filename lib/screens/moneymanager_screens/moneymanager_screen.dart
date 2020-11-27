import 'package:couplemanager/constants.dart';
import 'package:couplemanager/models/moneymanager_entrys_data.dart';
import 'package:couplemanager/screens/moneymanager_screens/add_screen.dart';
import 'package:couplemanager/screens/moneymanager_screens/split_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/components_moneymanager/moneymanager_headercard.dart';
import '../../components/components_moneymanager/expenses_list.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';


class MoneyManagerScreen extends StatefulWidget {
  static String id = 'moneymanager_screen';


  @override
  _MoneyManagerScreenState createState() => _MoneyManagerScreenState();
}

class _MoneyManagerScreenState extends State<MoneyManagerScreen> {
  Color buttonColor = kPrimaryColor;
  ScrollController scrollController;
  bool dialVisible = true;
  DateTime selectedDate = DateTime.now();



  // Methods for hiding FAB by scrolling
  @override
  void initState() {
    super.initState();
    // TODO
    // scrollController retriggers futueBuilder every time ... this leads to massive rebuilds during scrolling....
    // For now its decided to not use a scrollcontroller since it has only design advantages and does not provide any practical
    // function

    //scrollController = ScrollController();
      //scrollController.addListener(() {
        //setDialVisible(scrollController.position.userScrollDirection == ScrollDirection.forward);
     // });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  // Functions for moneymanager_headerCard
  Future<double> _getEntryExpenses() async{
    var entryProvider = Provider.of<EntryDataProvider>(context,listen: false);
    var data = await entryProvider.getExpense;
    return data;
  }

  void newDate(DateTime date){
    var entryProvider = Provider.of<EntryDataProvider>(context,listen: false);
    entryProvider.setSelectedDate(date);
    selectedDate = date;

  }
// End functions for moneymangaer_headerCard



  // Functions for espenses_list
  Future<List> _getEntrySnapforMonth() async{
    var entryProvider = Provider.of<EntryDataProvider>(context,listen: false);
    var data = await entryProvider.entryDataByMonth(selectedDate.toString());
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
      bottomNavigationBar: buildBottomNavigationBar(),
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
                  child: MoneyManagerHeaderCard(_getEntryExpenses(), newDate: newDate, selectedDate: selectedDate,),
                ),
              ),
              Expanded(flex: 200, child: ExpensesList(_getEntrySnapforMonth())),
              // old One using scrollController :Expanded(flex: 200, child: ExpensesList(scrollController: scrollController)),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(){
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.list), title: Text('Expenses')),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), title: Text('Categories')),
        BottomNavigationBarItem(
            icon: Icon(Icons.assessment), title: Text('Stats')),
      ],
    );

}

  SpeedDial buildSpeedDail(){
    return SpeedDial(
      overlayColor: Colors.white,
      visible: dialVisible,
      closeManually: false,
      backgroundColor: buttonColor,
      elevation: 5.0,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      curve: Curves.bounceIn,
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      foregroundColor: kFABforegroundColor,
      onOpen: (){
        setState(() {
          buttonColor = kFABcloseColor;
        });
      },
      onClose:(){
        setState(() {
          buttonColor = kPrimaryColor;
        });
      },

      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.apps),
          backgroundColor: kDarkColor,
          label: 'split expenses',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: (){
            Navigator.pushNamed(context, SplitScreen.id );
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: kDarkColor,
          label: 'add expense',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: (){
            Navigator.pushNamed(context, AddScreen.id );
          },
        ),
      ],
    );
  }


}
