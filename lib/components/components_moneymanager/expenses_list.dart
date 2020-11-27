import 'dart:collection';
import 'package:couplemanager/components/components_moneymanager/add_icon.dart';
import 'package:couplemanager/models/moneymanager_entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './task_tile_moneymanager.dart';
import '../../models/moneymanager_entrys_data.dart';

class ExpensesList extends StatefulWidget {
  @override
  _ExpensesListState createState() => _ExpensesListState();

  ExpensesList({this.scrollController});
  ScrollController scrollController;
}


class _ExpensesListState extends State<ExpensesList> {
  Future _future;


  void initState() {
    super.initState();
    EntryDataProvider entryData = EntryDataProvider();
    _future = _getEntrySnap(entryData);
  }


  Future<List> _getEntrySnap(EntryDataProvider entryData) async{
    var data = await entryData.entryData;
       return data;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(9),
        child: Card(
          elevation: 5,
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.black54,

            child: Consumer<EntryDataProvider>(
              builder: (context, entryData, child) {
                return FutureBuilder(
                  future: _future,
                  builder: (context,  AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState){
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.done:
                        if(snapshot.hasError){
                          print(snapshot.error.toString());
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }else
                        if (snapshot.hasData){
                          return ListView.separated(
                            // actual function is located in moneymanager_screen
                            controller: widget.scrollController,
                            itemCount: (snapshot.data.length == null) ? 0 : snapshot.data.length,
                            separatorBuilder: (BuildContext context, int index) => const Divider(height: 0),
                            itemBuilder: (BuildContext context, int index) {
                              final entry = snapshot.data[index];
                              return TaskTile(entry: entry);
                            },
                          );
                        }
                        return Center(child: Text("No Data"));

                    }
                    return Container();

                  },
                );
              },
            ),
          ),
        )
    );
  }
}





