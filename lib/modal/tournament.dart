import 'cricket_match.dart';

class Tournament {
  int _noOfMatches = 0;
  List<CricketMatch> matches = [];

  Tournament({int? noOfMatches, List<CricketMatch>? matchList}) {
    if (noOfMatches != null) {
      this.noOfMatches = noOfMatches;
    }
    if (matchList != null) {
      matches = matchList;
    } else {
      matches = [
        for (var _ in List.generate(this.noOfMatches, (i) => i)) CricketMatch()
      ];
    }
  }

  int get noOfMatches => _noOfMatches;

  set noOfMatches(int value) {
    if (value > _noOfMatches) {
      for (int i = 0; i < value - _noOfMatches; i++) {
        matches.add(CricketMatch());
      }
    }
    if (value < _noOfMatches) {
      for (int i = 0; i < _noOfMatches - value; i++) {
        matches.removeLast();
      }
    }
    _noOfMatches = value;
  }
}
