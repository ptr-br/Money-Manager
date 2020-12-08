import 'package:couplemanager/models/income_icons.dart';
import 'package:flutter/material.dart';
import 'package:couplemanager/constants.dart';
import 'package:provider/provider.dart';
import 'hero_dialog_route.dart';
import 'package:couplemanager/screens/moneymanager_screens/adding_screen.dart';

class IncomeScreen extends StatefulWidget {
  static String id = "income_screen";

  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IncomeIcons(),
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
              child: Consumer<IncomeIcons>(builder: (context, addData, child) {
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
                            builder: (BuildContext context) => AddingScreen(
                                iconID: tmpIcon.iconID,
                                iconName: tmpIcon.iconName,
                                type: "income"),
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
