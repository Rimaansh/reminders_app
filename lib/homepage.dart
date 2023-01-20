import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'notificationApi.dart';
import 'splashscreen.dart';
import 'customwidget.dart';

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  List<String> _reminders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: ListView.builder(
        itemCount: _reminders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_reminders[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _reminders.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Reminder'),
                content: TextField(
                  onSubmitted: (value) {
                    setState(() {
                      _reminders.add(value);
                    });
                    Navigator.of(context).pop();
                  },
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Add'),
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
    );
  }
}
