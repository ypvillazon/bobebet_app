class BetStats {
  late String id ;
  late String status;
  late double amount;
  late String target;
  late String targetDescription;
  late String email;
  late String eventDate;
  late String event;
  late String game ;
  late String createdAt;
  late double coeff ;
  late String betType ;
  late String sport ;
  late String sportType ;
  late String description ;

  BetStats.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    status = map['status'];
    amount = map['amount'];
    target = map['target'];
    sportType = map['sportType'];
    targetDescription = map['targetDescription'];
    email = map['email'];
    var s = DateTime.parse(map['eventDate']).toLocal() ;
    eventDate = "${s.year}/${s.month}/${s.day} ${s.hour}:${s.minute}:${s.second}" ;
    event = map['event'];
    game = map['game'];
    s = DateTime.parse(map['createdAt']).toLocal() ;
    createdAt = "${s.year}/${s.month}/${s.day} ${s.hour}:${s.minute}:${s.second}" ;
    coeff = map['coeff'];
    betType = map['betType'];
    sport = map['sport'];
    description = map['description'];

  }
}

class BetStatsResponse {
  late int statusCode ;
  late String message ;
  late List<BetStats> betStatsList ;
}

