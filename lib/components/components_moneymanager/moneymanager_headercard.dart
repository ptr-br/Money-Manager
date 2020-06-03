import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constants.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';


class MoneyManagerHeaderCard extends StatefulWidget {
  MoneyManagerHeaderCard({this.income, this.expanses});

  final int income;
  final int expanses;

  @override
  _MoneyManagerHeaderCardState createState() => _MoneyManagerHeaderCardState();
}

class _MoneyManagerHeaderCardState extends State<MoneyManagerHeaderCard> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //ser
          HeaderAndValue(name: 'Income', value: widget.income),
          VerticalDivider(
            width: 1,
            color: kDarkColor,
          ),
          HeaderAndValue(name: 'Expanses', value: widget.expanses),
          VerticalDivider(
            width: 1,
            color: kDarkColor,
          ),
          Expanded(
            flex: 1,
            child:  MaterialButton(
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
                      setState(
                            () {
                          selectedDate = date;
                        },
                      );
                    }
                  },
                );
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Date\n',
                  style: TextStyle(fontSize: 12, color: kTextColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${selectedDate.month}/${selectedDate.year}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    )
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

class HeaderAndValue extends StatelessWidget {
  HeaderAndValue({this.value, this.name});
  final String name;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: MaterialButton(
        onPressed: (){

        },
        minWidth: double.infinity,
        height: double.infinity,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: '$name\n',
              style: TextStyle(fontSize: 12, color: kTextColor),
              children: <TextSpan>[
                TextSpan(
                  text: '$value',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )
              ]),
        ),
      ),
    );
  }
}
