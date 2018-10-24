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
  int _pageIndex = 0;
  final List<Widget> _pages = <Widget>[
    DepartmentsPage(),
    ActionCardsPage(),
    ContactsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(primaryColor: Color.fromRGBO(237, 28, 36, 1.0)),
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(title: Text("SMTApp"), actions: <Widget>[
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
              body: _pages[_pageIndex],
              bottomNavigationBar: new Theme(
                data: Theme.of(context).copyWith(
                    canvasColor: Color.fromRGBO(237, 28, 36, 1.0),
                    primaryColor: Colors.white,
                    textTheme: Theme.of(context).textTheme.copyWith(
                        caption: new TextStyle(color: Color.fromRGBO(243, 99, 104, 1.0)))),
                child: BottomNavigationBar(
                    onTap: onTabTapped,
                    currentIndex: _pageIndex,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.view_list),
                          title: Text('Departments')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.report_problem),
                          title: Text('Action Cards')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.contacts), title: Text('Contacts')),
                    ]),
              ),
            )));
  }

  void onTabTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }
}
