import 'package:cric_scoring/modal/ball_record.dart';
import 'package:cric_scoring/modal/cricket_match.dart';
import 'package:cric_scoring/modal/out_type.dart';
import 'package:cric_scoring/modal/wicket.dart';

class MatchController {
  int? noOfOvers;
  int? noOfPlayers;
  int? currentOverNo;
  String? player_1;
  String? player_2;
  String? bowler;
  Map<String, List<BallRecord>> batsmen = {};

  void init() {}

  void addBatsman(String name) {
    if (batsmen[name] == null) {
      batsmen[name] = [];
    }
  }
}
