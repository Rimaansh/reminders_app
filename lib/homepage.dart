import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'notificationApi.dart';
import 'splashscreen.dart';
import 'loginPage.dart';
import 'customwidget.dart';
import 'package:intl/intl.dart';

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  List<Map<String, dynamic>> _reminders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Logout"),
                  content: Text("Do you wish to logout?"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("YES"),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                    ),
                    FlatButton(
                      child: Text("NO"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        title: Text("Dashboard"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _reminders.length,
        itemBuilder: (context, index) {
          final reminder = _reminders[index];
          return Container(
            margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                reminder['name'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(reminder['description'],
                        style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(new DateFormat.jm().format(reminder['dateTime']),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _reminders.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              var reminderNameController = TextEditingController();
              var reminderDescriptionController = TextEditingController();
              var _dateTime = DateTime.now();
              return AlertDialog(
                scrollable: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add Reminder'),
                    IconButton(
                      iconSize: 22,
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: reminderNameController,
                      decoration: InputDecoration(
                        labelText: 'Reminder Name',
                      ),
                    ),
                    TextField(
                      controller: reminderDescriptionController,
                      decoration: InputDecoration(
                        labelText: 'Reminder Description',
                      ),
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                      child: Text(
                        new DateFormat.yMd().add_jm().format(_dateTime),
                      ),
                      onPressed: () async {
                        final _picked = await showDatePicker(
                            context: context,
                            initialDate: _dateTime,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));
                        if (_picked != null) {
                          final _pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(_dateTime),
                          );
                          if (_pickedTime != null) {
                            setState(() {
                              _dateTime = DateTime(
                                  _picked.year,
                                  _picked.month,
                                  _picked.day,
                                  _pickedTime.hour,
                                  _pickedTime.minute);
                            });
                          }
                        }
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Add'),
                    onPressed: () {
                      setState(() {
                        _reminders.add({
                          'name': reminderNameController.text,
                          'description': reminderDescriptionController.text,
                          'dateTime': _dateTime
                        });
                      });
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("ALERT"),
                            content: Text(
                              "Reminder Set Successfully",
                              style: TextStyle(color: Colors.grey),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
