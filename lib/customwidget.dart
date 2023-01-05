import 'package:flutter/material.dart';

class customWidget extends StatelessWidget {
  final String msg =
      "Lorem ipsum dolor sit amet\nLorem ipsum dolor sit amet\nLorem ipsum dolor sit amet";
  final String txt;
  const customWidget(this.txt);
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
                      txt,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(child: Text(
                    msg,
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
