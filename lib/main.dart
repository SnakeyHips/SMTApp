import 'package:flutter/material.dart';
import 'package:myapp/app.dart';
import 'package:myapp/viewmodels/contact_viewmodel.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
  await ContactViewModel.loadContacts();
  MaterialPageRoute.debugEnableFadingRoutes = true;
  runApp(ScopedModel<ContactViewModel>(
      model: ContactViewModel(), child: SMTApp()));
}