import 'package:flutter/material.dart';
import 'package:SMTApp/app.dart';
import 'package:SMTApp/viewmodels/contact_viewmodel.dart';

void main() async {
  await ContactViewModel.loadContacts();
  MaterialPageRoute.debugEnableFadingRoutes = true;
  runApp(SMTApp());
}
