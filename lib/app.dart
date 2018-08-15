import 'package:flutter/material.dart';
import 'package:SMTApp/viewmodels/contact_viewmodel.dart';
import 'package:SMTApp/widgets/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

class SMTApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContactViewModel>(
      builder: (context, child, model) => MaterialApp(
            title: 'SMTApp',
            theme: new ThemeData(primaryColor: Colors.red),
            home: HomePage(),
          ),
    );
  }
}
