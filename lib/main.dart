import 'package:flutter/material.dart';
import 'package:SMTApp/app.dart';
import 'package:SMTApp/viewmodels/contact_viewmodel.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
  await ContactViewModel.loadContacts();
  MaterialPageRoute.debugEnableFadingRoutes = true;
  runApp(ScopedModel<ContactViewModel>(
      model: ContactViewModel(), child: SMTApp()));
}
