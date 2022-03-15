import 'dart:html';

import 'package:cric_scoring/constants.dart';
import 'package:cric_scoring/modal/cricket_match.dart';
import 'package:cric_scoring/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:cric_scoring/screens/home_screen.dart';
import 'package:flutter/services.dart';

class Selection extends StatefulWidget {
  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  TextEditingController players = TextEditingController();
  TextEditingController overs = TextEditingController();

  CricketMatch getMatch() {
    int over = int.parse(overs.text);
    int player = int.parse(players.text);
    CricketMatch match = new CricketMatch();
    match.noOfOvers = over;
    match.noOfPlayers = player;
    return match;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double container_height = height * 0.2;
    return Scaffold(
      appBar: Buildappbar(height),
      body: Container(
          child: Column(
        children: [
          Buildupperpart(container_height, height, width, context),
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(left: width * 0.2, right: width * 0.2),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    cursorColor: primary_color,
                    controller: players,
                    style: TextStyle(color: Colors.black),
                    cursorHeight: 30,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary_color),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Total No. of Players',
                        labelStyle: TextStyle(color: primary_color)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    cursorColor: primary_color,
                    cursorHeight: 30,
                    style: TextStyle(color: Colors.black),
                    obscureText: false,
                    controller: overs,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary_color),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Total No. of Overs',
                        labelStyle: TextStyle(color: primary_color)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.only(left: width * 0.2),
                  child: Row(children: [
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 0.2, color: Colors.black),
                          primary: background_color,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          minimumSize: Size(70, 60),
                        ),
                        child: const Text(
                          'Back',
                          style: TextStyle(
                              color: primary_color,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 0.2, color: Colors.black),
                          primary: primary_color,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          minimumSize: Size(70, 60),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          bool isfine = false;
                          if (players.value == null || overs.value == null) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                    "Values Can't Be Empty,Enter Please!"),
                                titleTextStyle: TextStyle(
                                    color: primary_color, fontSize: 15),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(
                                          fontSize: 20, color: primary_color),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if ((int.parse(players.text) > 11)) {
                            players.clear();
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                    "Players Can't Be Greater Than 11"),
                                titleTextStyle: TextStyle(
                                    color: primary_color, fontSize: 25),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(
                                          fontSize: 20, color: primary_color),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (((int.parse(overs.text) == 0)) ||
                              (int.parse(players.text) == 0)) {
                            if (int.parse(overs.text) == 0) {
                              overs.clear();
                            }
                            if (int.parse(players.text) == 0) {
                              players.clear();
                            } else {
                              players.clear();
                              overs.clear();
                            }
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Values Can't Be 0"),
                                titleTextStyle: TextStyle(
                                    color: primary_color, fontSize: 25),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(
                                          fontSize: 20, color: primary_color),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (int.parse(overs.text) > 50) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                    "Are You Sure to Play Too Many Overs ?"),
                                titleTextStyle: TextStyle(
                                    color: primary_color, fontSize: 20),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'NO'),
                                    child: const Text(
                                      'NO',
                                      style: TextStyle(
                                          fontSize: 20, color: primary_color),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'YES'),
                                    child: const Text(
                                      'YES',
                                      style: TextStyle(
                                          fontSize: 20, color: primary_color),
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainHome(
                                          match: getMatch(),
                                        )));
                          }
                        },
                      ),
                    )
                  ]),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  Container Buildupperpart(double container_height, double height, double width,
      BuildContext context) {
    return Container(
      height: container_height,
      child: Stack(
        children: [
          Container(
            height: height * 0.2 - 40,
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
                    "",
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
                  "Please, Choose To Start !",
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

  AppBar Buildappbar(double height) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      toolbarHeight: height * 0.1,
      title: Text(
        "Home",
        style: TextStyle(
            color: background_color, fontSize: 30, fontWeight: FontWeight.w700),
      ),
      backgroundColor: primary_color,
    );
  }
}
