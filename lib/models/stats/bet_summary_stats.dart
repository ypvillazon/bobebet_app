class BetSummaryStats {
  late String tags ;
  late String date ;
  late double stotal;
  late double swail;
  late double swon;
  late double slost;
  late int total;
  late int wail;
  late int won;
  late int lost;
  late double mwon ;

  BetSummaryStats.fromMap(Map<String, dynamic> map) {
    tags = map['tags'];
    date = map['date'];
    stotal = map['stotal'];
    swail = map['swail'];
    swon = map['swon'];
    slost = map['slost'];
    total = map['total'];
    wail = map['wail'];
    won = map['won'];
    lost = map['lost'];
    mwon = map['mwon'];
  }
}

class BetSummaryStatsResponse {
  late int statusCode ;
  late String message ;
  late List<BetSummaryStats> betSummaryStats ;
}

