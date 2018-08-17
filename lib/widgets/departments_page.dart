import 'package:flutter/material.dart';
import 'package:smtapp/utils/page_util.dart';
import 'package:smtapp/widgets/departments/example_page.dart';

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
          return _buildRow(index, departments[index]);
        });
  }

  Widget _buildRow(int index, String tag) {
    return Hero(
        tag: tag,
        child: new Material(
            color: Colors.white,
            child: new ListTile(
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
                      _launchPage(index, new SMTOnCallPage());
                      return;
                    case 1:
                      _launchPage(index, new BreakdownsPage());
                      return;
                    case 2:
                      _launchPage(index, new BusinessContinuityPage());
                      return;
                    case 3:
                      _launchPage(index, new BusinessSystemsPage());
                      return;
                    case 4:
                      _launchPage(index, new CollectionsPage());
                      return;
                    case 5:
                      _launchPage(index, new ExternalFreezerPage());
                      return;
                    case 6:
                      _launchPage(index, new FacilitiesPage());
                      return;
                    case 7:
                      _launchPage(index, new LaboratoriesPage());
                      return;
                    case 8:
                      _launchPage(index, new MajorIncidentPage());
                      return;
                    case 9:
                      _launchPage(index, new MediaTrustPage());
                      return;
                    case 10:
                      _launchPage(index, new TemperatureAnalysisPage());
                      return;
                    case 11:
                      _launchPage(index, new TransportPage());
                      return;
                    case 12:
                      _launchPage(index, new WTAILPage());
                      return;
                  }
                })));
  }

  void _launchPage(int index, Widget page) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text(departments[index]),
            backgroundColor: PageUtil.colors[index],
          ),
          body: page);
    }));
  }
}
