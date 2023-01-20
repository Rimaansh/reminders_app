import 'package:flutter/material.dart';
import 'dart:core';

class customWidget extends StatelessWidget {
  final String reminderDesc;
  final String reminderName;
  const customWidget(this.reminderName, this.reminderDesc);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
      ),
      child : Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Padding(padding: EdgeInsets.all(10)),
            Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Icon(
                  Icons.account_circle,
                  size: 70,
                )),
            //Padding(padding: EdgeInsets.all(50)),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Text(
                      reminderName,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(child: Text(
                    reminderDesc,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),),
                ],
              ),
            ),
          ],
        ),
    );
  }
}


class CustomWidgetList extends StatelessWidget {
  final List<String> items;

  CustomWidgetList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return customWidget("Reminder", "afjdlfa");
      },
    );
  }
}
