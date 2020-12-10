import 'package:couplemanager/constants.dart';
import 'package:couplemanager/screens/moneymanager_screens/adding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/moneymanager_screens/moneymanager_screen.dart';
import 'package:provider/provider.dart';
import './models/entrys_data.dart';
import './screens/moneymanager_screens/expenses_screen.dart';
import './screens/moneymanager_screens/income_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  // root widget of the application
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EntryDataProvider>(
      create: (context) => EntryDataProvider(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('de', 'DE'),
        ],
        // routes
        initialRoute: MoneyManagerScreen.id,
        routes: {
          MoneyManagerScreen.id: (context) => MoneyManagerScreen(),
          ExpensesScreen.id: (context) => ExpensesScreen(),
          IncomeScreen.id: (context) => IncomeScreen(),
          AddingScreen.id: (context) => AddingScreen()


        },

        debugShowCheckedModeBanner: false,
        title: 'Shared Manager',
        theme: ThemeData(
          primaryColor: kDarkColor,
          primaryColorDark: kDarkColor,
          primaryColorLight: kCardColor,
          accentColor: kTextMediumColor,
          primarySwatch: mainColorSwatch,
          //scaffoldBackgroundColor: kBackgroundColor,
          //textSelectionColor: kPrimaryColor,
          //buttonColor: kPrimaryColor,
          //splashColor: kPrimaryColor,
          //highlightColor: kPrimaryColor,
          //canvasColor: kPrimaryColor,
          //focusColor: kPrimaryColor,
          //disabledColor: kPrimaryColor,
          //shadowColor: kPrimaryColor,
          //dividerColor: kPrimaryColor,


          textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),

        ),
        home: MoneyManagerScreen(),

      ),
    );
  }
}