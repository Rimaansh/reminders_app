import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'homepage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 60,
        centerTitle: true,
        title: Text("Reminders App"),
        backgroundColor: Colors.red,
      ),
      body: Form(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Image(
                    width: 150,
                    height: 100,
                    image: AssetImage("images/logo.jpg"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      icon: Icon(Icons.email, size: 27,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      icon: Icon(Icons.key, size: 27,),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                RaisedButton(
                  color: Colors.red,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('LOGIN', style: TextStyle(fontSize: 17, color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );;
  }
}


