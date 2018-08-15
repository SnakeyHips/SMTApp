import 'dart:convert';
import 'package:SMTApp/models/contact.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class ContactViewModel extends Model {

  static List<Contact> contacts;

  static Future<String> _loadContactsAsset() async {
    return await rootBundle.loadString('assets/contacts.json');
  }

  static Future loadContacts() async {
    contacts = new List<Contact>();
    String jsonContacts = await _loadContactsAsset();
    List parsedJson = json.decode(jsonContacts);
    for(int i = 0; i < parsedJson.length; i++){
        contacts.add(new Contact.fromJson(parsedJson[i]));
    }
  }
}
