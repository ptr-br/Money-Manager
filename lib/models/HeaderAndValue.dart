
import 'package:couplemanager/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:couplemanager/models/entrys_data.dart';


class HeaderAndValue extends StatelessWidget{
  HeaderAndValue({ this.name,this.incomeOrExpenses,this.setIsExpense});
  Function setIsExpense;
  final String incomeOrExpenses;
  final String name;


  // check if income or expenses are needed
  double getIncomeOrExpenses(context){
    if(name == 'Income'){
      return double.parse((Provider.of<EntryDataProvider>(context).income).toStringAsFixed(2));
    }else{
      return double.parse((Provider.of<EntryDataProvider>(context).expenses).toStringAsFixed(2));
    }
  }




  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: MaterialButton(
        onPressed: () {
            Provider.of<EntryDataProvider>(context, listen: false).updateExpenses();
            Provider.of<EntryDataProvider>(context, listen: false).updateIncome();
            setIsExpense(name);

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
                  text: '${getIncomeOrExpenses(context)}',
                  style: kStyleHeaderText,
                )
              ]),
        ),
      ),
    );
  }
}
