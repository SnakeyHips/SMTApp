import 'package:flutter/material.dart';
import 'package:SMTApp/utils/page_util.dart';
import 'package:SMTApp/widgets/departments/example_page.dart';

class DepartmentsPage extends StatefulWidget {
  @override
  State createState() => DepartmentsPageState();
}

class DepartmentsPageState extends State<DepartmentsPage> {
  List<String> departments = [
    "department1",
    "department2"
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: new Padding(
          padding: new EdgeInsets.only(top: 8.0), child: _buildDepartments()),
    );
  }

  Widget _buildDepartments() {
    return ListView.builder(
        itemCount: departments.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(index);
        });
  }

  Widget _buildRow(int index) {
    return ListTile(
        leading: new CircleAvatar(
            backgroundColor: PageUtil.colors[index],
            foregroundColor: Colors.white,
            child: new Text(departments[index].substring(0, 1))),
        title: new Text(
          departments[index],
          style: new TextStyle(fontSize: 18.0),
        ),
        onTap: () async {
          switch (index) {
            case 0:
              _launchPage(index, new ExamplePage());
              return;
            case 1:
              _launchPage(index, new ExamplePage());
              return;
          }
        });
  }

  void _launchPage(int index, Widget page) {
    Navigator.push(context,
        new MaterialPageRoute<void>(builder: (BuildContext context) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text(departments[index]),
            backgroundColor: PageUtil.colors[index],
          ),
          body: page);
    }));
  }
}
