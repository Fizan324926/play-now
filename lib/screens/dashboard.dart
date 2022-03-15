import 'package:cric_scoring/components/widgets/app_bar.dart';
import 'package:cric_scoring/components/widgets/create_text.dart';
import 'package:cric_scoring/components/widgets/raised_button.dart';
import 'package:cric_scoring/constants.dart';
import 'package:cric_scoring/modal/cricket_match.dart';
import 'package:cric_scoring/screens/history.dart';
import 'package:cric_scoring/screens/stats.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  final CricketMatch match;
  const MainHome({Key? key, required this.match}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];
  @override
  void initState() {
    _widgetOptions = <Widget>[
      DashBoard(
        match: widget.match,
      ),
      History(),
      Stats()
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: APPBAR(
          text: "Cricket Scoring",
          height: height * 0.1,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: 'Stats',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primary_color,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class DashBoard extends StatefulWidget {
  final CricketMatch match;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  const DashBoard({Key? key, required this.match}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  String dropdownvalue = 'Batsman 1';

  // List of items in our dropdown menu
  var items = [
    'Batsman 1',
    'Batsman 2',
  ];

  int currentOver = 0;

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String Bowler_name = "Bowler";
    String score_txt = "1";
    String c_score = "129/3";
    String c_over = "12";
    String c_rr = "9.5";
    String Player1_name = "Player 1";
    String Player2_name = "Player 2";
    String Player1_rr = "7.6";
    String Player2_rr = "3.7";
    String player1_tr = "12";
    String player1_tpb = "7";
    String player1_r = player1_tr + " On " + player1_tpb + " Balls";
    String ball_r = "1";
    return Scaffold(
      backgroundColor: Color(0xFF1f2420),
      body: Container(
        child: Column(
          children: [
            Container(
                height: 20,
                margin: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                  color: primary_color,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                )),
            Container(
                margin:
                    EdgeInsets.only(right: width * 0.05, left: width * 0.05),
                child: Column(
                  children: [
                    BuildTeamC(),
                    Container(
                      //height: height - height * 0.28,
                      //width: width,
                      margin: EdgeInsets.only(top: 0),
                      decoration: BoxDecoration(
                        color: background_color,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            //height: height - height * 0.72,
                            decoration: BoxDecoration(
                              color: primary_color,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                BuildStats(width, c_score, c_over, c_rr),
                                Container(
                                  //l1
                                  margin: EdgeInsets.only(top: 2),
                                  // height: height * 0.2,

                                  decoration: BoxDecoration(
                                      color: primary_color,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),

                                  child: Column(
                                    //l2
                                    children: [
                                      Container(
                                        //l3.1
                                        //height: height * 0.088,
                                        margin: EdgeInsets.all(3),
                                        padding: EdgeInsets.only(
                                            left: width * 0.1,
                                            right: width * 0.1),
                                        decoration: BoxDecoration(
                                            color: background_color,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Column(
                                          //l4
                                          children: [
                                            Container(
                                              //l5.1
                                              child: Row(
                                                //l6
                                                children: [
                                                  Text(
                                                    Player1_name,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: primary_color),
                                                  ),
                                                  Container(
                                                    //height: height * 0.04,
                                                    width: 3,
                                                    color: primary_color,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "R.R",
                                                          style: TextStyle(
                                                              color:
                                                                  primary_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Text(
                                                          Player1_rr,
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 40),
                                                      child: Text(player1_r,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)))
                                                ],
                                              ), //6l
                                            ), //5.1l
                                            Container(
                                              //l5.2
                                              padding: EdgeInsets.only(
                                                  top: 5, bottom: 8),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "This Over:",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 30),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 10.0,
                                                            backgroundColor:
                                                                primary_color,
                                                            child: Text(ball_r,
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      background_color,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 10,
                                                                  fontFamily:
                                                                      'Roboto-Regular',
                                                                ))),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ) //5.2l
                                          ],
                                        ), //4l
                                      ), //3l
                                      Container(
                                        //l3.1
                                        //height: height * 0.088,
                                        margin: EdgeInsets.all(3),
                                        padding: EdgeInsets.only(
                                            left: width * 0.1,
                                            right: width * 0.1),
                                        decoration: BoxDecoration(
                                            color: background_color,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Column(
                                          //l4
                                          children: [
                                            Container(
                                              //l5.1
                                              child: Row(
                                                //l6
                                                children: [
                                                  Text(
                                                    Player1_name,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: primary_color),
                                                  ),
                                                  Container(
                                                    // height: height * 0.04,
                                                    width: 3,
                                                    color: primary_color,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "R.R",
                                                          style: TextStyle(
                                                              color:
                                                                  primary_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Text(
                                                          Player1_rr,
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 40),
                                                      child: Text(player1_r,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)))
                                                ],
                                              ), //6l
                                            ), //5.1l
                                            Container(
                                              //l5.2
                                              padding: EdgeInsets.only(
                                                  top: 5, bottom: 8),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "This Over:",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 30),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 10.0,
                                                            backgroundColor:
                                                                primary_color,
                                                            child: Text(ball_r,
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      background_color,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 10,
                                                                  fontFamily:
                                                                      'Roboto-Regular',
                                                                ))),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ) //5.2l
                                          ],
                                        ), //4l
                                      ),
                                      BuildBowlerStats(Bowler_name, width),
                                    ],
                                  ), //2l
                                ) //1l
                                ,
                                BuildScoreBoard(width),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Container BuildBowlerStats(String Bowler_name, double width) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Create_Text(
                    text: Bowler_name,
                    txt_color: background_color,
                    txt_size: 20,
                    txt_weight: FontWeight.w800,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: width * 0.2),
                  child: Create_Text(
                    text: "To",
                    txt_color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.2),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                CircleAvatar(
                    radius: 10.0,
                    backgroundColor: background_color,
                    child: Text("2",
                        style: TextStyle(
                          color: primary_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          fontFamily: 'Roboto-Regular',
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container BuildScoreBoard(double width) {
    return Container(
      color: primary_color,
      child: Container(
          margin: const EdgeInsets.only(
            top: 10,
          ),
          padding: EdgeInsets.only(left: 20),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: background_color),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Raised_Button(
                        text: "+",
                        height: 50,
                        width: width * 0.1,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Raised_Button(
                            text: "OUT",
                            height: 50,
                            width: width * 0.2,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Raised_Button(
                            text: "DOT",
                            height: 50,
                            width: width * 0.2,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Raised_Button(
                            text: "WIDE",
                            height: 50,
                            width: width * 0.2,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Raised_Button(
                      text: "NO BALL",
                      height: 50,
                      width: width * 0.2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Raised_Button(
                      text: "5",
                      height: 50,
                      width: width * 0.17,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Raised_Button(
                      text: "3",
                      height: 50,
                      width: width * 0.17,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Raised_Button(
                      text: "1",
                      height: 50,
                      width: width * 0.155,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Raised_Button(
                      text: "DEAD",
                      height: 50,
                      width: width * 0.2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Raised_Button(
                      text: "6",
                      height: 50,
                      width: width * 0.17,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Raised_Button(
                      text: "4",
                      height: 50,
                      width: width * 0.17,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Raised_Button(
                      text: "2",
                      height: 50,
                      width: width * 0.155,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Container BuildStats(
      double width, String c_score, String c_over, String c_rr) {
    return Container(
      padding: EdgeInsets.only(top: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: width * 0.15),
            child: Column(
              children: [
                Create_Text(
                  text: "Score",
                  txt_color: background_color,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    c_score,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: width * 0.15),
            child: Column(
              children: [
                Create_Text(
                  text: "Overs",
                  txt_color: background_color,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    c_over,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: width * 0.15),
            child: Column(
              children: [
                Create_Text(
                  text: "C.R.R",
                  txt_color: background_color,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    c_rr,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container BuildTeamC() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Team A",
            style: TextStyle(
              color: background_color,
              fontSize: 20,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't Want to Play?",
                style: TextStyle(
                  color: background_color,
                  fontSize: 15,
                ),
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: background_color,
                      fontSize: 15,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
