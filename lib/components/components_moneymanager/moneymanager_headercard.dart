import 'package:couplemanager/models/entrys_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constants.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';


class MoneyManagerHeaderCard extends StatelessWidget {

  MoneyManagerHeaderCard(this._future,{this.newDate,this.selectedDate,this.setIsExpense});

  Function setIsExpense;
  final DateTime selectedDate;
  final Future _future;
  final Function newDate;



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Consumer<EntryDataProvider>(
        builder: (context, entryData, child) {
          return FutureBuilder(
            future: _future,
            builder: (context, AsyncSnapshot snapshot) {

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
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        //ser
                        HeaderAndValue(name: 'Income', value: snapshot.data[1], setIsExpense: setIsExpense,),
                        VerticalDivider(
                          width: 1,
                          color: kDarkColor,
                        ),
                        HeaderAndValue(name: 'Expenses', value: snapshot.data[0], setIsExpense: setIsExpense,),

                        VerticalDivider(
                          width: 1,
                          color: kDarkColor,
                        ),
                        Expanded(
                          flex: 1,
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: double.infinity,
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              showMonthPicker(
                                context: context,
                                firstDate: DateTime(DateTime.now().year - 10, 12),
                                lastDate: DateTime(DateTime.now().year + 10, 12),
                                initialDate: DateTime.now(),
                                locale: Locale("en"),
                              ).then(
                                    (date) {
                                  if (date != null) {
                              newDate(date);
                                  }
                                },
                              );
                            },
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Date\n',
                                style: kStyleHeaderHeadline,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '${selectedDate.month}/${selectedDate.year}',
                                      style: kStyleHeaderText)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Center(child: Text("No Data"));

              }
              return Container();

            },
          );
        },
      ),
    );
  }
}

class HeaderAndValue extends StatelessWidget{
  HeaderAndValue({this.value, this.name,this.setIsExpense});
  Function setIsExpense;
  final String name;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: MaterialButton(
        onPressed: () {
          setIsExpense();
        },
        minWidth: double.infinity,
        height: double.infinity,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: '$name\n',
              style: kStyleHeaderHeadline,
              children: <TextSpan>[
                TextSpan(
                  text: '$value',
                  style: kStyleHeaderText,
                )
              ]),
        ),
      ),
    );
  }
}





