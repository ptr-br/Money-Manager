import 'package:couplemanager/components/components_moneymanager/add_icon.dart';
import 'package:flutter/material.dart';


class CalculationScreen extends StatelessWidget {
  CalculationScreen({this.addIcon});
  final AddIcon addIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 250.0,
                width: 250.0,
                child: Hero(
                    tag: 'hero${addIcon.name}',
                    child: Container(child: addIcon)),
              ),
            ),
            OutlineButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.close),
            )
          ],
        ),
      ),
    );
  }
}