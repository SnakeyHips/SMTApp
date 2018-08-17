import 'package:flutter/material.dart';
import 'package:smtapp/utils/page_util.dart';

class ExamplePage extends StatefulWidget {
  @override
  State createState() => ExamplePageState();
}

class ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "Example Page",
        child: Material(
            color: Colors.white,
            child: new ListView.builder(
              padding:
                  new EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
              itemCount: 1,
              itemBuilder: (context, int index) {
                return new Column(
                  children: <Widget>[
                    PageUtil.headerText("text"),
                  ],
                );
              },
            )));
  }
}
