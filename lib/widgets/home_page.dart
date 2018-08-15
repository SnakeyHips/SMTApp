import 'package:flutter/material.dart';
import 'package:SMTApp/utils/page_util.dart';
import 'package:SMTApp/widgets/actioncards_page.dart';
import 'package:SMTApp/widgets/contacts_page.dart';
import 'package:SMTApp/widgets/departments_page.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(primaryColor: Colors.red),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "DEPARTMENTS"),
                      Tab(text: "ACTION CARDS"),
                      Tab(text: "CONTACTS")
                    ],
                    indicatorColor: Colors.white,
                  ),
                  title: Text("SMTApp"),
                  actions: <Widget>[
                    PopupMenuButton(
                        itemBuilder: (context) => <PopupMenuItem<String>>[
                              new PopupMenuItem<String>(
                                child: new GestureDetector(
                                    child: new Text("Email"),
                                    onTap: () async {
                                      await PageUtil.launchEmail("test");
                                      Navigator.of(context).pop();
                                    }),
                              ),
                              new PopupMenuItem<String>(
                                child: new GestureDetector(
                                    child: new Text("About"),
                                    onTap: () async {
                                      await PageUtil.aboutDialog(context);
                                      Navigator.of(context).pop();
                                    }),
                              ),
                            ]),
                  ]),
              body: TabBarView(
                children: <Widget>[
                  new DepartmentsPage(),
                  new ActionCardsPage(),
                  new ContactsPage(),
                ],
              )),
        ));
  }
}
