class GanarPartidoConHandicapOption {

  late double homeHandicap ;
  late double coeffHomeHandicap ;
  late bool showH;
  late double awayHandicap ;
  late double coeffAwayHandicap ;
  late bool showA;


  GanarPartidoConHandicapOption.fromMap(Map<String, dynamic> map) {
    homeHandicap = map['homeHandicap'];
    coeffHomeHandicap = map['coeffHomeHandicap'];
    showH = map['showH'];
    awayHandicap = map['awayHandicap'];
    coeffAwayHandicap = map['coeffAwayHandicap'];
    showA = map['showA'];
  }

}

