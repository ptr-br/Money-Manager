import 'package:flutter/material.dart';

class SplitScreen extends StatelessWidget {
  static String id = "split_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Split expenses"),
        )
    );
  }
}
