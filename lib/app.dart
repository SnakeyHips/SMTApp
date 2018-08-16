import 'package:flutter/material.dart';
import 'package:SMTApp/widgets/home_page.dart';

class SMTApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
            title: 'SMTApp',
            theme: new ThemeData(primaryColor: Colors.red),
            home: HomePage(),
          );
  }
}
