import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'homepage.dart';
import 'dart:core';

class LoginScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<LoginScreen> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email = "", _pass = "";

  _showSnackbar() {
    var snackBar = new SnackBar(content: Text("Login Successful"));
    scaffoldKey.currentState?.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/7,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/logo.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) => (val?.contains("@") ?? false)
                              ? null
                              : "Email Id is not Valid",
                          onSaved: (val) => _email = val ?? "",
                          decoration: InputDecoration(
                              labelText: "Email", hintText: "Enter Email"),
                        ),
                        TextFormField(
                          onSaved: (val) => _pass = val ?? "",
                          validator: (val) => (val?.length ?? 0) < 6
                              ? "Password length should be Greater than 6"
                              : null,
                          decoration: InputDecoration(
                              labelText: "Password", hintText: "Enter Password"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: RaisedButton(
                            color: Colors.red,
                            child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 15),),
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                formKey.currentState?.save();
                                _showSnackbar();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReminderPage()));
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
