import 'package:flutter/material.dart';
import 'package:smtapp/models/contact.dart';
import 'package:smtapp/utils/page_util.dart';
import 'package:smtapp/viewmodels/contact_viewmodel.dart';

class ContactsPage extends StatefulWidget {
  @override
  State createState() => ContactsPageState();
}

class ContactsPageState extends State<ContactsPage> {
  TextEditingController controller = new TextEditingController();
  String filter;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Padding(
                padding: new EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                child: new TextField(
                  style: new TextStyle(fontSize: 18.0, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: new Icon(Icons.search),
                    suffixIcon: new IconButton(
                      icon: new Icon(Icons.close),
                      onPressed: () {
                        controller.clear();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                    hintText: "Search...",
                  ),
                  controller: controller,
                )),
            new Expanded(
              child: new Padding(
                  padding: new EdgeInsets.only(top: 8.0),
                  child: _buildContacts()),
            )
          ],
        ));
  }

  Widget _buildContacts() {
    return ListView.builder(
        itemCount: ContactViewModel.contacts.length,
        itemBuilder: (BuildContext context, int index) {
          if (filter == null || filter == "") {
            return _buildRow(ContactViewModel.contacts[index]);
          } else {
            if (ContactViewModel.contacts[index].name
                .toLowerCase()
                .contains(filter.toLowerCase())) {
              return _buildRow(ContactViewModel.contacts[index]);
            } else {
              return new Container();
            }
          }
        });
  }

  Widget _buildRow(Contact c) {
    return new ListTile(
        title: new Text(
          c.name,
          style: new TextStyle(fontSize: 18.0),
        ),
        subtitle: new Text(
          c.title,
        ),
        onTap: () async {
          PageUtil.contactDialog(context, c);
        });
  }
}
