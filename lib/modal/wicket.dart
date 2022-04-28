import 'out_type.dart';

class Wicket {
  String outPlayerName = "";
  OutType outType = OutType.wicketOut;
  int extraRun = 0;
  Wicket({String? player, int? score, OutType? outType}) {
    if (player != null) {
      outPlayerName = player;
    }
    if (score != null) {
      extraRun = score;
    }
    if (outType != null) {
      this.outType = outType;
    }
  }
}
