import 'package:flutter/material.dart';
import 'package:SMTApp/models/contact.dart';
import 'package:SMTApp/utils/page_util.dart';
import 'package:SMTApp/viewmodels/contact_viewmodel.dart';

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
        new TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16.0),
            prefixIcon: new Icon(Icons.search),
            hintText: "Search...",
          ),
          controller: controller,
        ),
        new Expanded(
          child: _buildContacts(),
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
