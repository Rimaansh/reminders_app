import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'splashscreen.dart';
import 'customwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  String get txt => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 30,
        ),
        titleSpacing: 0,
        leadingWidth: 60,
        centerTitle: false,
        title: Text("Dashboard"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
            alignment: Alignment.topLeft,
            child: Text(
              "Today",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
          customWidget('Reminder 1'),
          customWidget('Reminder 2'),
          customWidget('Reminder 3'),
          customWidget('Reminder 4'),
          customWidget('Reminder 5'),
          customWidget('Reminder 6'),
        ],
      ),
    );
  }
}
