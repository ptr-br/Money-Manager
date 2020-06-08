import 'package:couplemanager/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/components_moneymanager/add_icon.dart';
import '../../models/moneymanager_add_data.dart';

class AddScreen extends StatefulWidget {
  static String id = "add_screen";

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  AddIcon _selectedIcon;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddData(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Select category"),
          backgroundColor: kDarkColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Container(
              child: Consumer<AddData>(builder: (context, addData, child) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final tmpAllIcons = addData.addDataList;
                    final tmpIcon = addData.addDataList[index];
                    return GestureDetector(
                        onTap: () {
                          // TODO hier methode auslagern um zu hohe komplexität zu vermeiden
                          for (int i=0;i<addData.iconsCount; i++){
                            addData.addDataList[i].isSelected = false;

                          }
                          setState(() {
                            tmpIcon.isSelected = true;
                          });
                        },
                        child: tmpIcon.build(context));
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
