import '../../models/HeaderAndValue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constants.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';
import 'package:couplemanager/models/entrys_data.dart';



class MoneyManagerHeaderCard extends StatelessWidget {

  MoneyManagerHeaderCard({this.newDate, this.selectedDate, this.setIsExpense});

  Function setIsExpense;
  final DateTime selectedDate;
  final Function newDate;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //ser
          HeaderAndValue(name: 'Einnahmen', incomeOrExpenses: 'income',setIsExpense: setIsExpense),
          VerticalDivider(
            width: 1,
            color: kDarkColor,
          ),
          HeaderAndValue(name: 'Ausgaben', incomeOrExpenses: 'expenses',setIsExpense:setIsExpense),

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
                  firstDate: DateTime(DateTime
                      .now()
                      .year - 10, 12),
                  lastDate: DateTime(DateTime
                      .now()
                      .year + 10, 12),
                  initialDate: DateTime.now(),
                  locale: Locale("en"),
                ).then(
                      (date) {
                    if (date != null) {
                      newDate(date);
                      Provider.of<EntryDataProvider>(context, listen: false).updateExpenses();
                      Provider.of<EntryDataProvider>(context, listen: false).updateIncome();
                    }
                  },
                );
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Datum\n',
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
      ),
    );
  }
}
