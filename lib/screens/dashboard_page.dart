import 'package:cric_scoring/components/widgets/circular_ball.dart';
import 'package:cric_scoring/components/widgets/create_text.dart';
import 'package:cric_scoring/components/widgets/header_part.dart';
import 'package:cric_scoring/components/widgets/raised_button.dart';
import 'package:cric_scoring/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard_Page extends StatefulWidget {
  @override
  State<Dashboard_Page> createState() => _Dashboard_PageState();
}

class _Dashboard_PageState extends State<Dashboard_Page> {
  String _batsman1Name = "Mavia"; //getBatsman1Name()
  String _batsman2Name = "Asad Tariq"; //getBatsman2Name()
  String _bolwerName = "Ali Raza"; //getBowlerName()
  String _batsman1Total = "10 on 17 balls"; //getBatsman1Total()
  String _batsman2Total = "32 on 48 balls"; //getBatsman2Total()
  String _currentScore = "42/0"; //getCurrentScore()
  String _currentOvers = "7.3"; //getCurrentOvers()
  String _currentRR = "6.1"; //getCurrentRunRate()
  String facingBatsmanName = "Ahmad";

  StepState() {
    String facingBatsmanName = "Ahmad";
  }

  /**
   *        Batsman1 Score
   */
  List<Widget> _bat1ScoreList = [];
  List<Widget> _bat2ScoreList = [];
  List<Widget> _bowlerScoreList = [];
  void _addRun(String run, String facingBatsman) {
    setState(() {
      if (facingBatsman.toLowerCase() == _batsman1Name.toLowerCase()) {
        _bat1ScoreList.add(_scoreBall(run));
      } else {
        _bat2ScoreList.add(_scoreBall(run));
      }
      _bowlerScoreList.add(_scoreBall(run));
    });
  }

  Widget _scoreBall(String text) {
    return Ball(text: text);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double _dHeaderHeight = _height * 0.13;
    double _dTeamsHeight = _height * 0.07;
    double _dMatchHeight = _height * 0.09;
    double _dBatingHeight = _height * 0.22;
    double _dBowlingHeight = _height * 0.10;
    double _dBoardHeight = _height * 0.27;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          /*
          
                       Header Part


          
           */
          BuildHeader(_dHeaderHeight, _width),
          /*
              
              
                        Teams Stats
              
              
              
               */
          BuildTeamsPart(_dTeamsHeight, _width),
          Container(
            width: _width,
            margin: EdgeInsets.symmetric(horizontal: _width * 0.045),
            decoration: BoxDecoration(
                color: primary_color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                /*

                              Match Stats

                 */
                BuildMatchStats(_dMatchHeight, _width),

                /*
                                Bating Stats
                */

                BuildBatingPart(_dBatingHeight, _width, _height),

                /*
                                  Bowling Stats
                     */
                BuildBowlerPart(_width, _height, _dBowlingHeight),

                /*
                      Score Board
                     */
                BuildScoreBoard(_dBoardHeight, _width, _height),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container BuildBatingPart(
      double _dBatingHeight, double _width, double _height) {
    return Container(
      height: _dBatingHeight,
      width: _width,
      decoration: BoxDecoration(
          color: background_color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Container(
          //height: _dBatingHeight,
          //width: _width,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /*
                      
                         Batsman 1 stats
                      
                       */
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: _width * 0.04, vertical: _height * 0.003),
            height: _dBatingHeight / 2 - 1,
            //decoration: BoxDecoration(color: primary_color),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: _width * 0.35,
                      decoration: BoxDecoration(),
                      child: Create_Text(
                        text: _batsman1Name,
                        txt_size: 20,
                        txt_weight: FontWeight.w600,
                      ),
                    ),
                    /*
                              
                                   Batsman 1 Total Run



                               */
                    Container(
                      width: _width * 0.3,
                      decoration: BoxDecoration(),
                      child: Create_Text(
                        text: _batsman1Total,
                        txt_color: black_color,
                        txt_weight: FontWeight.w400,
                        txt_size: 16,
                      ),
                    )
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Create_Text(
                        text: "This over",
                        txt_color: black_color,
                        txt_size: 14,
                        txt_weight: FontWeight.w500,
                      ),
                      width: _width * 0.20,
                      decoration: BoxDecoration(),
                    ),
                    Container(
                      width: _width * 0.5,
                      decoration: BoxDecoration(),
                      child:
                          /**
                                

                                       Batsman 1 Score
                                
                                
                                 */
                          Row(
                        children: [
                          Container(
                            width: _width * 0.5,
                            height: 18,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _bat1ScoreList.length,
                              itemBuilder: (context, index) {
                                return _bat1ScoreList[index];
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: _height * 0.0008,
            width: _width * 0.2,
            color: Colors.black.withOpacity(0.5),
          ),

          /*
                      
                      
                      Batsman 2 Stats
                      
                      
                       */
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: _width * 0.04, vertical: _height * 0.003),
            height: _dBatingHeight / 2 - 1,
            //decoration: BoxDecoration(color: primary_color),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: _width * 0.35,
                      decoration: BoxDecoration(),
                      child: Create_Text(
                        text: _batsman2Name,
                        txt_size: 20,
                        txt_weight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: _width * 0.3,
                      decoration: BoxDecoration(),
                      child: Create_Text(
                        text: _batsman2Total,
                        txt_color: black_color,
                        txt_weight: FontWeight.w400,
                        txt_size: 16,
                      ),
                    )
                  ],
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Create_Text(
                        text: "This over",
                        txt_color: black_color,
                        txt_size: 14,
                        txt_weight: FontWeight.w500,
                      ),
                      width: _width * 0.25,
                      decoration: BoxDecoration(),
                    ),
                    Container(
                      width: _width * 0.5,
                      decoration: BoxDecoration(),
                      child:
                          /**
                                

                                       Batsman 2 Score
                                
                                
                                 */
                          Row(
                        children: [
                          Container(
                            width: _width * 0.5,
                            height: 18,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _bat2ScoreList.length,
                              itemBuilder: (context, index) {
                                return _bat2ScoreList[index];
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  Container BuildBowlerPart(
      double _width, double _height, double _dBowlingHeight) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: _width * 0.04, vertical: _height * 0.003),
        height: _dBowlingHeight,
        width: _width,
        decoration: BoxDecoration(
          color: background_color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: _height * 0.001,
              //width: _width * 0.5,
              color: Colors.black,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: _width * 0.3,
                      decoration: BoxDecoration(),
                      child: Create_Text(
                        text: _bolwerName,
                        txt_size: 20,
                        txt_weight: FontWeight.w600,
                      )),
                  Container(
                    width: _width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Create_Text(
                          text: "to",
                          txt_size: 18,
                          txt_weight: FontWeight.w500,
                          txt_color: black_color,
                        ),
                        Create_Text(text: "box")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            /*
                                   Bowler    Balls Stats
                       */
            Container(
                width: _width * 0.7,
                //decoration: BoxDecoration(color: background_color),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Create_Text(
                        text: "This over",
                        txt_color: black_color,
                        txt_size: 14,
                        txt_weight: FontWeight.w500,
                      ),
                      width: _width * 0.20,
                      decoration: BoxDecoration(),
                    ),
                    Container(
                      width: _width * 0.5,
                      decoration: BoxDecoration(),
                      child:
                          /**
                                

                                       Batsman 1 Score
                                
                                
                                 */
                          Row(
                        children: [
                          Container(
                            width: _width * 0.5,
                            height: 18,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _bowlerScoreList.length,
                              itemBuilder: (context, index) {
                                return _bowlerScoreList[index];
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }

  Container BuildScoreBoard(
      double _dBoardHeight, double _width, double _height) {
    return Container(
        height: _dBoardHeight,
        width: _width,
        padding: EdgeInsets.symmetric(
            horizontal: _width * 0.05, vertical: _height * 0.015),
        decoration: BoxDecoration(color: background_color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Raised_Button(
                  text: "+",
                ),
                Raised_Button(
                  width: _width * 0.2,
                  text: "Out",
                ),
                Raised_Button(
                  width: _width * 0.2,
                  text: "Wide",
                ),
                Raised_Button(
                  width: _width * 0.2,
                  text: "Dot",
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Raised_Button(
                  text: "No Ball",
                  width: _width * 0.2,
                ),
                Raised_Button(
                  text: "5",
                  width: _width * 0.175,
                  onPressed: () => _addRun("5", facingBatsmanName),
                ),
                Raised_Button(
                  text: "3",
                  width: _width * 0.175,
                  onPressed: () => _addRun("3", facingBatsmanName),
                ),
                Raised_Button(
                  text: "1",
                  width: _width * 0.175,
                  onPressed: () => _addRun("1", facingBatsmanName),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Raised_Button(
                  text: "Dead",
                  width: _width * 0.2,
                ),
                Raised_Button(
                  text: "6",
                  width: _width * 0.175,
                  onPressed: () => _addRun("6", facingBatsmanName),
                ),
                Raised_Button(
                  text: "4",
                  width: _width * 0.175,
                  onPressed: () => _addRun("4", facingBatsmanName),
                ),
                Raised_Button(
                    text: "2",
                    width: _width * 0.175,
                    onPressed: () => _addRun("2", facingBatsmanName)),
              ],
            )
          ],
        ));
  }

  Container BuildMatchStats(double _dMatchHeight, double _width) {
    return Container(
        height: _dMatchHeight,
        width: _width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Create_Text(
                    text: "Score",
                    txt_color: background_color,
                  ),
                  Create_Text(
                    text: _currentScore,
                    txt_color: Colors.black.withOpacity(0.4),
                    txt_size: 15,
                    txt_weight: FontWeight.w500,
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Create_Text(
                    text: "Overs",
                    txt_color: background_color,
                  ),
                  Create_Text(
                    text: _currentOvers,
                    txt_color: Colors.black.withOpacity(0.8),
                    txt_size: 15,
                    txt_weight: FontWeight.w500,
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Create_Text(
                    text: "C.R.R",
                    txt_color: background_color,
                  ),
                  Create_Text(
                    text: _currentRR,
                    txt_color: Colors.black.withOpacity(0.8),
                    txt_size: 15,
                    txt_weight: FontWeight.w500,
                  )
                ],
              ),
            )
          ],
        ));
  }

  Expanded BuildTeamsPart(double _dTeamsHeight, double _width) {
    return Expanded(
      child: Container(
          height: _dTeamsHeight,
          width: _width,
          //color: Colors.green,
          child: const Text("10 % Teams Stats")),
    );
  }

  Container BuildHeader(double _dHeaderHeight, double _width) {
    return Container(
        height: _dHeaderHeight,
        width: _width,
        child: const Header_Part(
          textMain: "Home",
          totalHeight: 0.1,
          backgroudColor: black_color,
        ));
  }
}
