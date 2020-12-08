import 'package:couplemanager/constants.dart';
import 'package:couplemanager/screens/moneymanager_screens/adding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/expenses_icons.dart';
import 'hero_dialog_route.dart';

class ExpensesScreen extends StatefulWidget {
  static String id = "add_screen";

  @override
  _ExpensesScreen createState() => _ExpensesScreen();
}

class _ExpensesScreen extends State<ExpensesScreen> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpensesIcons(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Kategorie auswählen"),
          backgroundColor: kDarkColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Container(
              child: Consumer<ExpensesIcons>(builder: (context, addData, child) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final tmpAllIcons = addData.addDataList;
                    final tmpIcon = addData.addDataList[index];
                    return GestureDetector(
                      onTap: () {
                        for (int i = 0; i < addData.iconsCount; i++) {
                          addData.addDataList[i].isSelected = false;
                        }
                        setState(() {
                          tmpIcon.isSelected = true;

                        });
                        Navigator.push(
                            context,
                            HeroDialogRoute(
                                builder: (BuildContext context) =>
                                        AddingScreen(iconID: tmpIcon.iconID, iconName: tmpIcon.iconName, type: "expense")
                        ),
                        );
                      },
                      child: Hero(
                        tag: 'hero${tmpIcon.iconName}',

                        // prevent hero from overfloating
                        flightShuttleBuilder: (
                          BuildContext flightContext,
                          Animation<double> animation,
                          HeroFlightDirection flightDirection,
                          BuildContext fromHeroContext,
                          BuildContext toHeroContext,
                        ) {
                          return SingleChildScrollView(
                            child: fromHeroContext.widget,
                          );
                        },

                        transitionOnUserGestures: true,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Container(child: tmpIcon.build(context)),
                        ),
                      ),
                    );
                  },
                  itemCount: addData.iconsCount,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
