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
    return MaterialApp(
        theme: new ThemeData(primaryColor: Color.fromRGBO(237, 28, 36, 1.0)),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.view_list)),
                      Tab(icon: Icon(Icons.report_problem)),
                      Tab(icon: Icon(Icons.contacts))
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
                          ],
                      onSelected: (result) async {
                        if (result == "Email") {
                          await PageUtil.launchEmail("test");
                        } else if (result == "About") {
                          await PageUtil.aboutDialog(context);
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
