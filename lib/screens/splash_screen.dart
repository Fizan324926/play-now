import 'dart:async';

import 'package:cric_scoring/constants.dart';
import 'package:cric_scoring/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home_Screen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: text_color,
              radius: 80,
              child: CircleAvatar(
                backgroundColor: background_color,
                radius: 75,
                backgroundImage: AssetImage(
                  'assets/images/logo1.png',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(background_color),
              ),
            )
          ],
        ),
      ),
    );
  }
}
