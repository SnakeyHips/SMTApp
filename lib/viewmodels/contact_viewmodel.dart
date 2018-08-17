import 'dart:convert';
import 'package:smtapp/models/contact.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class ContactViewModel {

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
