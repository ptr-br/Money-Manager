import 'package:flutter/material.dart';
import './task_tile_moneymanager.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({this.entries});

  final List<String> entries;


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(9),
        child: Card(
          elevation: 5,
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.black54,
            child: ListView.separated(
              itemCount: entries.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(height: 0,),
              itemBuilder: (BuildContext context, int index){
                return TaskTile();
              },
            ),
          ),
        )
    );
  }
}
