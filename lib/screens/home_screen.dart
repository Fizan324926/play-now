import 'dart:html';

import 'package:cric_scoring/constants.dart';
import 'package:cric_scoring/screens/saved.dart';
import 'package:cric_scoring/screens/settings.dart';
import 'package:flutter/material.dart';

import 'start_selction.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String start_text = "START NEW";
    String load_text = "LOAD SAVED";
    String settings_text = "SETTINGS";
    double container_height = height * 0.3 - 30;

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: text_color,
      backgroundColor: primary_color,
      minimumSize: Size(170, 60),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );

    return Scaffold(
      appBar: BuildAppBar(height),
      body: Column(
        children: [
          Buildupperpart(height, width, context, container_height),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: height * 0.6,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: width * 0.35),
                        child: Center(
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment(-2.5, 0.05),
                                children: [
                                  TextButton(
                                      style: flatButtonStyle,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Selection()),
                                        );
                                      },
                                      child: Text(
                                        start_text,
                                        style: TextStyle(
                                          color: background_color,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )),
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 40,
                                    child: CircleAvatar(
                                      backgroundColor: background_color,
                                      radius: 38,
                                      backgroundImage: AssetImage(
                                        'assets/images/bg_circle.png',
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: width * 0.25),
                        child: Center(
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment(2.5, 0.2),
                                children: [
                                  TextButton(
                                      style: flatButtonStyle,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Saved()),
                                        );
                                      },
                                      child: Text(
                                        load_text,
                                        style: const TextStyle(
                                          color: background_color,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )),
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 40,
                                    child: CircleAvatar(
                                      backgroundColor: background_color,
                                      radius: 38,
                                      child: Image.asset(
                                        "assets/images/logo1.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: width * 0.35),
                        child: Center(
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment(-2.5, 0.05),
                                children: [
                                  TextButton(
                                      style: flatButtonStyle,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const VideoPlayerScreen()),
                                        );
                                      },
                                      child: Text(
                                        settings_text,
                                        style: TextStyle(
                                          color: background_color,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )),
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 40,
                                    child: CircleAvatar(
                                      backgroundColor: background_color,
                                      radius: 38,
                                      backgroundImage: AssetImage(
                                        'assets/images/bg_lines.png',
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container Buildupperpart(
      double height, double width, BuildContext context, container_height) {
    return Container(
      height: container_height,
      child: Stack(
        children: [
          Container(
            height: height * 0.3 - 60,
            decoration: BoxDecoration(
                color: primary_color,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36))),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: width * 0.08),
                  child: Text(
                    "CRICKET SCORING",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 54,
              margin: EdgeInsets.symmetric(horizontal: default_padding),
              decoration: BoxDecoration(
                color: background_color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 50,
                      offset: Offset(0, 10),
                      color: primary_color.withOpacity(0.23))
                ],
              ),
              // ignore: prefer_const_constructors
              child: Center(
                child: Text(
                  "Let's Get Started!",
                  style: TextStyle(
                    color: primary_color,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar BuildAppBar(double height) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      toolbarHeight: height * 0.1,
      title: Text(
        "WELCOME !",
        style: TextStyle(
            color: background_color, fontSize: 30, fontWeight: FontWeight.w700),
      ),
      backgroundColor: primary_color,
    );
  }
}
