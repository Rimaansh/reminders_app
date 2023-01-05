import 'package:flutter/material.dart';
import 'homepage.dart';
import 'loginPage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
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
          )
      ),
    );
  }
}