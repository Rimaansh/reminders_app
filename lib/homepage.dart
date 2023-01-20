import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'notificationApi.dart';
import 'splashscreen.dart';
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
        title: Text('Reminders'),
      ),
      body: ListView.builder(
        itemCount: _reminders.length,
        itemBuilder: (context, index) {
          final reminder = _reminders[index];
          return Container(
            margin: EdgeInsets.fromLTRB(3, 10, 3, 0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightBlue, // border color
                  width: 2.0, // border width
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text(
                  reminder['name'],
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(reminder['description']),
                      SizedBox(
                        height: 10,
                      ),
                      Text(new DateFormat.jm().format(reminder['dateTime']), textAlign: TextAlign.left,),
                    ],
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _reminders.removeAt(index);
                    });
                  },
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              var reminderNameController = TextEditingController();
              var reminderDescriptionController = TextEditingController();
              var _dateTime = DateTime.now();

              return AlertDialog(
                title: Text('Add Reminder'),
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
