import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'NotificationApi.dart';
import 'splashscreen.dart';
import 'customwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  String get txt =>
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("NEW REMINDERS", style: TextStyle(fontSize: 13),),
                    IconButton(
                      icon: Icon(Icons.close, size: 18,),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Reminder Name", style: TextStyle(color: Colors.grey, fontSize: 10)),
                    Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
                    Text("Please Enter Reminder Name", style: TextStyle(color: Colors.black, fontSize: 14)),
                    Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 0)),
                    Divider(color: Colors.black),
                    Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                    Text("Reminder Description", style: TextStyle(color: Colors.grey, fontSize: 10)),
                    Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
                    Text("Please Enter Reminder Description", style: TextStyle(color: Colors.black, fontSize: 14)),
                    Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 0)),
                    Divider(color: Colors.black),
                    Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                    RaisedButton(
                      child: Text("Select Image", style: TextStyle(color: Colors.red)),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          child: Text("SAVE", style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('ALERT'),
                                  content: Text(
                                    'Reminder Set Successfully',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        'OK',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                          ..pop()
                                          ..pop();
                                        NotificationApi.showNotification(
                                          title: 'Reminder Added',
                                          body: 'Congrats! The notification has been added',
                                          payload: 'notif.abs'
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          color: Colors.red,
                        ),
                        RaisedButton(
                          child: Text("RESET", style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
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
