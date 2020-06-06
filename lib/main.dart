import 'package:couplemanager/constants.dart';
import 'package:couplemanager/screens/home_screen.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/shoppinglist_screen.dart';
import 'screens/todo_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/moneymanager_screen.dart';
import 'package:provider/provider.dart';
import './models/moneymanager_entrys_data.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  String licenseKey = 'NT8mJyc2IWhia31ifWN9Z2FoYmF8YGJ8ampqanNiYmlmamlmanMDHmgjNic2ITEyJjYhYmp9an1qZBM0PjI6P30wPD4=';


  // root widget of the application
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EntryData(),
      child: MaterialApp(
        // routes
        initialRoute: HomeScreeen.id,
        routes: {
          HomeScreeen.id: (context) => HomeScreeen(),
          ChatScreen.id: (context) => ChatScreen(),
          ShoppingList_Screen.id: (context) => ShoppingList_Screen(),
          TodoScreen.id: (context) => TodoScreen(),
          CalendarScreen.id: (context) => CalendarScreen(),
          MoneyManagerScreen.id: (context) => MoneyManagerScreen(),
        },

        debugShowCheckedModeBanner: false,
        title: 'Shared Manager',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),

        ),
        home: HomeScreeen(),

      ),
    );
  }
}