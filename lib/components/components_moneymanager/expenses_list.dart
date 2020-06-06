import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './task_tile_moneymanager.dart';
import '../../models/moneymanager_entrys_data.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({this.scrollController});

  ScrollController scrollController;


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(9),
        child: Card(
          elevation: 5,
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.black54,

            child: Consumer<EntryData>(
              builder: (context,entryData,child){


                return ListView.separated(
                  // actual function is located in moneymanager_screen
                  controller: scrollController,
                  itemCount: entryData.entryCount,
                  separatorBuilder: (BuildContext context, int index) => const Divider(height: 0,),
                  itemBuilder: (BuildContext context, int index){
                    final entry = entryData.entryData[index];
                    return TaskTile(
                      icon: entry.icon,
                      cardName:entry.cardName,
                      //timeStamp: entry.timeStamp,
                      description: entry.description,
                      expense: entry.expense,
                    );
                  },
                );
              },
            ),
          ),
        )
    );
  }
}
