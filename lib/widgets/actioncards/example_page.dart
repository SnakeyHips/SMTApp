import 'package:flutter/material.dart';
import 'package:SMTApp/utils/page_util.dart';

class ExamplePage extends StatefulWidget {
  @override
  State createState() => ExamplePageState();
}

class ExamplePageState extends State<ExamplePage> {
  String text1initials = "";
  String text1time = "";
  TextField task1initials;
  TextField task1time;

  @override
  void initState() {
    super.initState();
    task1initials = new TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(hintText: "Initials"),
      onChanged: (String text) {
        setState(() {
          text1initials = text;
        });
      },
    );
    task1time = new TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(hintText: "00:00"),
      onChanged: (String text) {
        setState(() {
          text1time = text;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "Example Page",
        child:  Material(
          color: Colors.white,
          child: new ListView.builder(
            padding: new EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
            itemCount: 1,
            itemBuilder: (context, int index) {
              return new Column(
                children: <Widget>[
                  PageUtil.inputRow(24.0, task1initials, task1time),
                ],
              );
            },
        )));
  }
}
