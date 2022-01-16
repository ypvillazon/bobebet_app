class GanarPartidoConHandicapAsiaticoOption {

  late String homeHandicap ;
  late double coeffHomeHandicap ;
  late bool showH;
  late String awayHandicap ;
  late double coeffAwayHandicap ;
  late bool showA;

  GanarPartidoConHandicapAsiaticoOption.fromMap(Map<String, dynamic> map) {
    homeHandicap = map['homeHandicap'];
    coeffHomeHandicap = map['coeffHomeHandicap'];
    showH = map['showH'];
    awayHandicap = map['awayHandicap'];
    coeffAwayHandicap = map['coeffAwayHandicap'];
    showA = map['showA'];
  }

}

