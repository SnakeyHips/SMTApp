import 'dart:async';
import 'package:flutter/material.dart';
import 'package:SMTApp/models/contact.dart';
import 'package:SMTApp/utils/zoomable_image.dart';
import 'package:SMTApp/viewmodels/contact_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class PageUtil {
  static List<MaterialColor> colors = [
    Colors.red,
    Colors.deepOrange,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lime,
    Colors.lightGreen,
    Colors.green,
    Colors.teal,
    Colors.cyan,
    Colors.lightBlue,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  static Future<Null> launchPhone(String number) async {
    if (number != "---") {
      String url = "tel:" + number;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw "Could not launch $url";
      }
    }
  }

  static Future<Null> launchEmail(String text) async {
    String url =
        "mailto:super.jake@hotmail.co.uk?subject=Log&body=Log: " + text;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  static Future<Null> launchWebsite(String website) async {
    String url = "https:" + website;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  static Future<Null> contactDialog(BuildContext context, Contact c) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text(c.name, textAlign: TextAlign.center, style: new TextStyle(fontWeight: FontWeight.bold)),
            contentPadding: new EdgeInsets.all(24.0),
            children: <Widget>[
              new Container(
                  margin: new EdgeInsets.only(bottom: 8.0),
                  child: new Text(c.title, textAlign: TextAlign.center, style: new TextStyle(fontWeight: FontWeight.bold),)),
              new Container(
                  margin: new EdgeInsets.only(bottom: 8.0),
                  child: new Divider()),
              new Container(
                  margin: new EdgeInsets.only(bottom: 8.0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text("Number: "),
                        new GestureDetector(
                            child: new Text(c.number,
                                style: new TextStyle(color: Colors.red)),
                            onTap: () async {
                              await launchPhone(c.number);
                              await logDialog(context);
                            }),
                      ])),
              new Container(
                  margin: new EdgeInsets.only(bottom: 8.0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text("AltNumber: "),
                        new GestureDetector(
                            child: new Text(c.altNumber,
                                style: new TextStyle(color: Colors.red)),
                            onTap: () async {
                              await launchPhone(c.altNumber);
                              await logDialog(context);
                            }),
                      ])),
              new Container(
                  margin: new EdgeInsets.only(bottom: 8.0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text("ShortCode: "),
                        new Text(c.shortCode)
                      ])),
            ],
          );
        });
  }

  static Future<Null> logDialog(BuildContext context) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          content: new Text("Do you wish to log this call?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('Yes'),
              onPressed: () async {
                await launchEmail("test");
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<Null> aboutDialog(BuildContext context) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text("SMTApp - Flutter"),
          content: new Text("Version 7.0 - 15/06/2018"),
          actions: <Widget>[
            new FlatButton(
              child: new Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Widget contactText(BuildContext context, String name) {
    Contact c = ContactViewModel.contacts
        .firstWhere((contact) => contact.name == name, orElse: null);
    return new Container(
        margin: new EdgeInsets.only(top: 24.0),
        child: new GestureDetector(
            child: new Text(name,
                style: new TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold)),
            onTap: () async {
              await contactDialog(context, c);
            }));
  }

  static Widget headerText(String header) {
    return new Container(
        margin: new EdgeInsets.only(top: 24.0),
        child: new Text(header,
            textAlign: TextAlign.center,
            style: new TextStyle(fontWeight: FontWeight.bold)));
  }

  static Widget pageText(String text) {
    return new Container(
        margin: new EdgeInsets.only(top: 24.0), child: new Text(text));
  }

  static Widget pageURL(String url) {
    return new Container(
        margin: new EdgeInsets.only(top: 24.0),
        child: new GestureDetector(
            child: new Text(url,
                style: new TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold)),
            onTap: () async {
              await launchWebsite(url);
            }));
  }

  static Widget textRow(double marginTop, String string1, String string2) {
    return new Container(
        margin: new EdgeInsets.only(top: marginTop),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[new Text(string1), new Text(string2)]));
  }

  static Widget inputRow(double marginTop, TextField field1, TextField field2) {
    return new Container(
        margin: new EdgeInsets.only(top: marginTop),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                  child: new Padding(
                      padding: new EdgeInsets.only(right: 48.0),
                      child: field1)),
              new Flexible(
                  child: new Padding(
                      padding: new EdgeInsets.only(left: 48.0), child: field2))
            ]));
  }

  static Widget sendButton(BuildContext context, String text,
      MaterialColor color, String emailText) {
    return new Container(
        margin: new EdgeInsets.only(top: 24.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new RaisedButton(
                child: new Text(text),
                color: color,
                textColor: Colors.white,
                onPressed: () async {
                  launchEmail(emailText);
                })
          ],
        ));
  }

  static Widget pageImage(BuildContext context, String imagePath,
      String appBarTitle, MaterialColor color) {
    return new Container(
        margin: new EdgeInsets.only(top: 24.0),
        child: new GestureDetector(
            child: new Image.asset(imagePath, fit: BoxFit.contain),
            onTap: () async {
              Navigator.push(
                  context,
                  new MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return new Scaffold(
                            appBar: new AppBar(
                              title: new Text(appBarTitle),
                              backgroundColor: color,
                            ),
                            body: new ZoomableImage(new AssetImage(imagePath)));
                      },
                      fullscreenDialog: true));
            }));
  }
}
