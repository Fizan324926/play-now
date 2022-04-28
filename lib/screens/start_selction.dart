// ignore_for_file: unnecessary_new

import 'dart:html';

import 'package:cric_scoring/components/widgets/create_text.dart';
import 'package:cric_scoring/components/widgets/header_part.dart';
import 'package:cric_scoring/constants.dart';
import 'package:cric_scoring/controller/match_controller.dart';
import 'package:cric_scoring/modal/cricket_match.dart';
import 'package:cric_scoring/screens/dashboard.dart';
import 'package:cric_scoring/screens/main_page.dart';
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
  TextEditingController facingBatsman =
      TextEditingController(text: "Batsman 1");
  TextEditingController runingBatsman =
      TextEditingController(text: "Batsman 2");
  TextEditingController bowler = TextEditingController(text: "Bowler 1");

  _NamesDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Create_Text(text: "One More Step!"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    cursorColor: primary_color,
                    controller: facingBatsman,
                    style: TextStyle(color: Colors.black),
                    cursorHeight: 30,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary_color),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Name of facing Batsman',
                        labelStyle: TextStyle(color: primary_color)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    cursorColor: primary_color,
                    controller: runingBatsman,
                    style: TextStyle(color: Colors.black),
                    cursorHeight: 30,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary_color),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Name of Runing Batsman',
                        labelStyle: TextStyle(color: primary_color)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    cursorColor: primary_color,
                    controller: bowler,
                    style: TextStyle(color: Colors.black),
                    cursorHeight: 30,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary_color),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Name of Bowler',
                        labelStyle: TextStyle(color: primary_color)),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              // ignore: unnecessary_new
              new FlatButton(
                child: new Create_Text(text: "Done"),
                onPressed: () {
                  if (facingBatsman.text.isNotEmpty &&
                      runingBatsman.text.isNotEmpty &&
                      bowler.text.isNotEmpty) {
                    MatchController.player_1 = facingBatsman.text;
                    MatchController.player_2 = runingBatsman.text;
                    MatchController.bowler = bowler.text;
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  } else {
                    showAlertDialog(context);
                  }
                },
              )
            ],
          );
        });
  }

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
      //appBar: Buildappbar(height),
      body: Container(
          child: Column(
        children: [
          Header_Part(textMain: "Home", totalHeight: 0.1),
          //Buildupperpart(container_height, height, width, context),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home_Screen()),
                          );
                        },
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
                          if (validate(context)) {
                            MatchController.noOfOvers = int.parse(overs.text);
                            MatchController.noOfPlayers =
                                int.parse(players.text);
                            _NamesDialog(context);
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

  bool validate(BuildContext context) {
    var _players = players.text.toString();
    var _overs = overs.text.toString();
    if (_players.isEmpty ||
        _overs.isEmpty ||
        int.parse(_players) > 11 ||
        int.parse(_overs) > 50 ||
        int.parse(_players) < 2 ||
        int.parse(_overs) < 1) {
      // empty
      showAlertDialog(context);
    } else {
      return true;
    }
    return false;
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Ivalid Values"),
      content: Text("Please enter correct values!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
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
