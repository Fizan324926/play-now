import 'over.dart';
import 'team.dart';

class CricketMatch {
  String name = "";
  int _noOfOvers = 0;
  int noOfPlayers = 0;
  List<Team> teams = [Team("team 1"), Team("team 2")];
  List<Over> overs = [];

  int get noOfOvers => _noOfOvers;

  set noOfOvers(int value) {
    if (_noOfOvers > value) {
      for (int i = 0; i < _noOfOvers - value; i++) {
        overs.removeLast();
      }
    }
    if (value > _noOfOvers) {
      for (int i = 0; i < value - _noOfOvers; i++) {
        overs.add(Over());
      }
    }
    _noOfOvers = value;
  }
}
