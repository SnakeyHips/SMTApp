import 'package:flutter/material.dart';
import 'package:smtapp/utils/page_util.dart';
import 'package:smtapp/widgets/actioncards_page.dart';
import 'package:smtapp/widgets/contacts_page.dart';
import 'package:smtapp/widgets/departments_page.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  final GlobalKey _menuKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: DefaultTabController(
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
                      key: _menuKey,
                      itemBuilder: (context) => <PopupMenuItem>[
                            new PopupMenuItem<String>(
                                child: const Text("Email"), value: "Email"),
                            new PopupMenuItem<String>(
                                child: const Text("About"), value: "About"),
                            new PopupMenuItem<String>(
                                child: const Text("Weather"), value: "Weather"),
                          ],
                      onSelected: (result) async {
                        if (result == "Email") {
                          await PageUtil.launchEmail("test");
                        } else if (result == "About") {
                          await PageUtil.aboutDialog(context);
                        } else if (result == "Weather") {
                          await PageUtil.weatherDialog(context);
                        } 
                      },
                    ),
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
