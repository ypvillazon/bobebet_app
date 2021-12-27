class GanarPartidoConHandicapAsiaticoOption {

  String homeHandicap ;
  double coeffHomeHandicap ;
  bool showH;
  String awayHandicap ;
  double coeffAwayHandicap ;
  bool showA;

  GanarPartidoConHandicapAsiaticoOption.fromMap(Map<String, dynamic> map) :
    homeHandicap = map['homeHandicap'],
    coeffHomeHandicap = map['coeffHomeHandicap'],
    showH = map['showH'],
    awayHandicap = map['awayHandicap'],
    coeffAwayHandicap = map['coeffAwayHandicap'],
    showA = map['showA'];


}

