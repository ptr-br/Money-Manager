import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.home,size: 50,),
            Text("5424"),
            Text('Ausgaben für das Haus')
          ],
        ),
    );

  }
}





