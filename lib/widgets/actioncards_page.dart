import 'package:flutter/material.dart';
import 'package:myapp/utils/page_util.dart';
import 'package:myapp/widgets/actioncards/example_page.dart';

class ActionCardsPage extends StatefulWidget {
  @override
  State createState() => ActionCardsPageState();
}

class ActionCardsPageState extends State<ActionCardsPage> {
  List<String> actioncards = [
    "action card 1"
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: _buildActionCards(),
    );
  }

  Widget _buildActionCards() {
    return ListView.builder(
        itemCount: actioncards.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(index);
        });
  }

  Widget _buildRow(int index) {
    return ListTile(
        leading: new CircleAvatar(
            backgroundColor: PageUtil.colors[index],
            foregroundColor: Colors.white,
            child: new Text(actioncards[index].substring(0, 1))),
        title: new Text(
          actioncards[index],
          style: new TextStyle(fontSize: 18.0),
        ),
        onTap: () async {
          switch (index) {
            case 0:
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
            title: new Text(actioncards[index]),
            backgroundColor: PageUtil.colors[index],
          ),
          body: page);
    }));
  }
}
