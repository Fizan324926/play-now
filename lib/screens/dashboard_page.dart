import 'package:cric_scoring/components/widgets/circular_ball.dart';
import 'package:cric_scoring/components/widgets/create_text.dart';
import 'package:cric_scoring/components/widgets/header_part.dart';
import 'package:cric_scoring/components/widgets/raised_button.dart';
import 'package:cric_scoring/components/widgets/snakbar.dart';
import 'package:cric_scoring/constants.dart';
import 'package:cric_scoring/controller/match_controller.dart';
import 'package:cric_scoring/modal/ball_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard_Page extends StatefulWidget {
  @override
  State<Dashboard_Page> createState() => _Dashboard_PageState();
}

class _Dashboard_PageState extends State<Dashboard_Page> {
  String _batsman1Name = ""; //getBatsman1Name()
  String _batsman2Name = ""; //getBatsman2Name()
  String _bolwerName = ""; //getBowlerName()
  String _batsman1Total = "10 on 17 balls"; //getBatsman1Total()
  String _batsman2Total = "32 on 48 balls"; //getBatsman2Total()
  String _currentScore = ""; //getCurrentScore()
  String _currentOvers = "";
  String _totalOvers = ""; //getCurrentOvers()
  String _currentRR = ""; //getCurrentRunRate()
  String facingBatsmanName = "";
  String selectedBatsman = "";
  TextEditingController newBatsman = TextEditingController(text: "New Batsman");
  TextEditingController extraRunOnOut = TextEditingController();
  TextEditingController newBowler = TextEditingController(text: "New Bowler");
  int currentScore = 0;
  int currentOut = 0;

  @override
  void initState() {
    super.initState();
    updateNames();
  }

  void updateNames() {
    _batsman1Name = MatchController.player_1 ?? "batsman1";
    _batsman2Name = MatchController.player_2 ?? "batsman2";
    _bolwerName = MatchController.bowler ?? "bowler";
    _totalOvers = MatchController.noOfOvers.toString();
    selectedBatsman = _batsman1Name;
    facingBatsmanName = selectedBatsman;
    _currentScore = currentScore.toString() + "/" + currentOut.toString();
    _currentOvers = MatchController.currentOverNo.toString() +
        "." +
        MatchController.currentBall.toString();
    _currentRR = (currentScore / MatchController.currentOverNo).toString();
  }

  List<DropdownMenuItem<String>> get facingBatsmanItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text(_batsman1Name), value: _batsman1Name),
      DropdownMenuItem(child: Text(_batsman2Name), value: _batsman2Name),
    ];
    return menuItems;
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

  // on out dialouge

  _NamesDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Create_Text(text: "Who is Out ?"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                  dropdownColor: primary_color,
                  style: const TextStyle(
                    color: black_color,
                    fontWeight: FontWeight.w500,
                  ),
                  value: selectedBatsman,
                  items: facingBatsmanItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBatsman = newValue!;
                      facingBatsmanName = selectedBatsman;
                    });
                  },
                ),
                TextField(
                  cursorColor: primary_color,
                  controller: newBatsman,
                  style: TextStyle(color: Colors.black),
                  cursorHeight: 30,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary_color),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Name of New Batsman',
                      labelStyle: TextStyle(color: primary_color)),
                ),
                TextField(
                  cursorColor: primary_color,
                  controller: extraRunOnOut,
                  style: TextStyle(color: Colors.black),
                  cursorHeight: 30,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary_color),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Any Extra Run?',
                      labelStyle: TextStyle(color: primary_color)),
                ),
              ],
            ),
            actions: <Widget>[
              // ignore: unnecessary_new
              new FlatButton(
                child: new Create_Text(text: "Cancel"),
                onPressed: () {},
              ),
              new FlatButton(
                child: new Create_Text(text: "Done"),
                onPressed: () {},
              )
            ],
          );
        });
  }

  void onOut() {
    _NamesDialog(context);
  }

  // add functions
  void throwBall(
      {required int run,
      int ballCount = 1,
      bool isShuffle = false,
      String? other}) {
    String text = other ?? run.toString();
    MatchController.addBall(BallRecord(
        ballno: MatchController.currentBall,
        score: run,
        bowler: _bolwerName,
        batsman: selectedBatsman,
        overno: MatchController.currentOverNo));
    setState(() {
      if (selectedBatsman == _batsman1Name) {
        _bat1ScoreList.add(_scoreBall(text));
      } else {
        _bat2ScoreList.add(_scoreBall(text));
      }
      _bowlerScoreList.add(_scoreBall(text));
      currentScore += run;
      MatchController.currentBall += ballCount;
      if (MatchController.currentBall == 6) {
        MatchController.currentOverNo += 1;
        MatchController.currentBall = 1;
      }
      _currentScore = currentScore.toString() + "/" + currentOut.toString();
      _currentOvers = MatchController.currentOverNo.toString() +
          "." +
          MatchController.currentBall.toString();
      _currentRR = (currentScore / MatchController.currentOverNo).toString();
    });
    if (isShuffle) {
      setState(() {
        if (selectedBatsman == _batsman1Name) {
          selectedBatsman = _batsman2Name;
        } else {
          selectedBatsman = _batsman1Name;
        }
      });
    }
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
                        Container(
                          height: _height * 0.06,
                          child: DropdownButton(
                            dropdownColor: primary_color,
                            style: const TextStyle(
                              color: black_color,
                              fontWeight: FontWeight.w500,
                            ),
                            value: selectedBatsman,
                            items: facingBatsmanItems,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedBatsman = newValue!;
                                facingBatsmanName = selectedBatsman;
                              });
                            },
                          ),
                        )
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
                  onPressed: () => {onOut()},
                ),
                Raised_Button(
                  width: _width * 0.2,
                  text: "Wide",
                  onPressed: () => throwBall(run: 1, ballCount: 0, other: "W"),
                ),
                Raised_Button(
                  width: _width * 0.2,
                  text: "Dot",
                  onPressed: () => {throwBall(run: 0, other: ".")},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Raised_Button(
                  text: "No Ball",
                  width: _width * 0.2,
                  onPressed: () =>
                      {throwBall(run: 1, ballCount: 0, other: "N")},
                ),
                Raised_Button(
                    text: "5",
                    width: _width * 0.175,
                    onPressed: () => throwBall(
                        run: 5,
                        isShuffle: true) //_addRun("5", facingBatsmanName),
                    ),
                Raised_Button(
                    text: "3",
                    width: _width * 0.175,
                    onPressed: () => throwBall(
                        run: 3,
                        isShuffle: true) //_addRun("3", facingBatsmanName),
                    ),
                Raised_Button(
                    text: "1",
                    width: _width * 0.175,
                    onPressed: () => throwBall(
                        run: 1,
                        isShuffle: true) //_addRun("1", facingBatsmanName),
                    ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Raised_Button(
                  text: "Dead",
                  width: _width * 0.2,
                  onPressed: () =>
                      {throwBall(run: 0, ballCount: 0, other: "D")},
                ),
                Raised_Button(
                    text: "6",
                    width: _width * 0.175,
                    onPressed: () =>
                        throwBall(run: 6) //_addRun("6", facingBatsmanName),
                    ),
                Raised_Button(
                    text: "4",
                    width: _width * 0.175,
                    onPressed: () =>
                        throwBall(run: 4) //_addRun("4", facingBatsmanName),
                    ),
                Raised_Button(
                    text: "2",
                    width: _width * 0.175,
                    onPressed: () => throwBall(run: 2)),
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
                    txt_color: Colors.black,
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
                    text: _currentOvers + " / " + _totalOvers,
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
