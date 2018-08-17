import 'package:flutter/material.dart';
import 'package:smtapp/app.dart';
import 'package:smtapp/viewmodels/contact_viewmodel.dart';

void main() async {
  await ContactViewModel.loadContacts();
  MaterialPageRoute.debugEnableFadingRoutes = true;
  runApp(SMTApp());
}
