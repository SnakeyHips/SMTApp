import 'package:flutter/material.dart';
import 'package:smtapp/widgets/home_page.dart';

class SMTApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
            title: 'SMTApp',
            theme: new ThemeData(primaryColor: Color.fromRGBO(237, 28, 36, 1.0)),
            home: HomePage(),
          );
  }
}
