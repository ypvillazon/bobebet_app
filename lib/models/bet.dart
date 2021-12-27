
import 'dart:convert';

class Bet {
  double amount;
  String eventId;
  String targetName;
  String targetDescription;
  double coeff;
  String type;

  Bet(this.amount, this.eventId, this.targetName, this.targetDescription, this.coeff, this.type);

  String toJson() {
    var map = new Map();
    map["amount"] = amount;
    map["eventId"] = eventId;
    map["targetName"] = targetName;
    map["targetDescription"] = targetDescription;
    map["coeff"] = coeff;
    map["type"] = type;
    String json = jsonEncode(map);
    return json;
  }
}

class Bets {
  late String id ;
  late String status ;
  late double amount ;
  late String target ;
  late String targetDescription ;
  late String eventId ;
  late String userId ;
  late double coeff ;
  late String eventDate ;
  late String sport;
  late String sportType;
  late String event ;
  late String game;
  late String betType ;
  late String description ;

  Bets.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    status = map['status'];
    amount = map['amount'];
    target = map['target'];
    sportType = map['sportType'];
    targetDescription = map['targetDescription'];
    eventId = map['eventId'];
    userId = map['userId'];
    coeff = double.parse((map['coeff']).toStringAsFixed(3));
    var s = DateTime.parse(map['eventDate']).toLocal() ;
    eventDate = "${s.year}/${s.month}/${s.day} ${s.hour}:${s.minute}:${s.second}" ;
    sport = map['sport'];
    event = map['event'];
    game = map['game'];
    betType = map['betType'];
    description = map['description'];
  }

}

class BetsResponse {
  late int statusCode ;
  late String message ;
  late List<Bets> bets ;
}

class OneBetResponse {
  late int statusCode ;
  late String message ;
  late Bets bet ;
}


