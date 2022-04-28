// import 'wicket.dart';
//
// class BallRecord {
//   int score = 0;
//   int ballCount = 1;
//   Wicket? wicket;
//   BallRecord({int? score, int? ballCount, Wicket? wicket}) {
//     if (score != null) {
//       this.score = score;
//     }
//     if (ballCount != null) {
//       this.ballCount = ballCount;
//     }
//     if (wicket != null) {
//       this.wicket = wicket;
//     }
//   }
// }

class BallRecord {
  int? id;
  int ballno = 0;
  int score = 0;
  int overno = 0;
  String bowler = "";
  String batsman = "";
  BallRecord(
      {required this.ballno,
      required this.score,
      required this.bowler,
      required this.batsman,
      required this.overno});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['ballno'] = ballno;
    map['overno'] = overno;
    map['score'] = score;
    map['bowler'] = bowler;
    map['batsman'] = batsman;

    return map;
  }

  BallRecord.fromMapObject(Map<String, dynamic> map) {
    id = map['id'];
    ballno = map['ballno'];
    overno = map['overno'];
    score = map['score'];
    bowler = map['bowler'];
    batsman = map['batsman'];
  }
}
