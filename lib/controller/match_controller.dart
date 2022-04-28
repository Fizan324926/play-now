import 'package:cric_scoring/SQL_Assignment/database_helper.dart';
import 'package:cric_scoring/modal/ball_record.dart';

class MatchController {
  static int? noOfOvers;
  static int? noOfPlayers;
  static int currentOverNo = 0;
  static int currentBall = 0;
  static String? player_1;
  static String? player_2;
  static String? bowler;
  static Map<String, List<BallRecord>> batsmen = {};
  static DatabaseHelper? databaseHelper;

  static void init() {
    databaseHelper ??= DatabaseHelper();
    databaseHelper?.initializeDatabase();
  }

  static void addBatsman(String name) {
    if (batsmen[name] == null) {
      batsmen[name] = [];
    }
  }

  static void addBall(BallRecord record) {
    databaseHelper?.insertBallRecord(record);
    if (batsmen[record.batsman] == null) {
      batsmen[record.batsman] = [];
    }
    batsmen[record.batsman]?.add(record);
  }

  static String getBatsmanStats(String name) {
    if (batsmen[name] == null) {
      return "0 on 0 Balls";
    }
    int score = 0;
    for (var record in batsmen[name]!) {
      score += record.score;
    }
    return score.toString() +
        " on " +
        batsmen[name]!.length.toString() +
        " balls";
  }
}
