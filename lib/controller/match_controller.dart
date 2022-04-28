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

  void init() {
    databaseHelper ??= DatabaseHelper();
    databaseHelper?.initializeDatabase();
  }

  void addBatsman(String name) {
    if (batsmen[name] == null) {
      batsmen[name] = [];
    }
  }

  static void addBall(BallRecord record) {
    databaseHelper?.insertBallRecord(record);
    batsmen[record.batsman]?.add(record);
  }
}
