import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'homepage.dart';
import 'loginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: Image(
                width: 150,
                height: 150,
                image: AssetImage("images/logo.jpg"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Center(
                child: Text("Reminders App",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Kalam'
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


