class BetSummaryStatsByUser {
  String user ;
  // String lastBetDate;
  double stotal;
  double swail;
  double swon;
  double slost;
  int total;
  int wail;
  int won;
  int lost;
  double mwon ;

  BetSummaryStatsByUser.fromMap(Map<String, dynamic> map) :
    user = map['user'],
    stotal = map['stotal'],
    swail = map['swail'],
    swon = map['swon'],
    slost = map['slost'],
    total = map['total'],
    wail = map['wail'],
    won = map['won'],
    lost = map['lost'],
    mwon = map['mwon'];

}

class BetSummaryStatsByUserResponse {
  late int statusCode ;
  late String message ;
  late List<BetSummaryStatsByUser> betSummaryStatsByUsers ;
}

