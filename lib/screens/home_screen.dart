import 'package:couplemanager/components/reusable_card.dart';
import 'package:couplemanager/constants.dart';
import 'package:couplemanager/screens/calendar_screen.dart';
import 'package:couplemanager/screens/chat_screen.dart';
import 'package:couplemanager/screens/moneymanager_screen.dart';
import 'package:couplemanager/screens/todo_screen.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card_content.dart';
import 'shoppinglist_screen.dart';
import '../models/moneymanager_entrys_data.dart';

class HomeScreeen extends StatelessWidget {
  static String id = 'home_screen';
  Color mainColor = kCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkColor,
        elevation: 0.5,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.list), iconSize: 35.0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // Ab hier aufbau des Layouts
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: CardContent(iconName: 'message'),
                    colour: mainColor,
                    onPress: () {
                      Navigator.pushNamed(context, ChatScreen.id);
                      print('Jump to Chat screen');
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      cardChild: CardContent(iconName: 'money'),
                      colour: mainColor,
                      onPress: () {
                        Navigator.pushNamed(context, MoneyManagerScreen.id);
                        print('Jump to MoneyManager screen');
                      },
                    ),

                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      print('Jump to ShoppingList screen');
                      Navigator.pushNamed(context, ShoppingList_Screen.id);
                    },
                    cardChild: CardContent(iconName: 'shopping-card'),
                    colour: mainColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: CardContent(iconName: 'checklist'),
                    colour: mainColor,
                    onPress: () {
                      print('Jump to Todo screen');
                      Navigator.pushNamed(context, TodoScreen.id);
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: CardContent(iconName: 'calendar'),
                    colour: mainColor,
                    onPress: () {
                      print('Jump to Calendar screen');
                      Navigator.pushNamed(context, CalendarScreen.id);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
