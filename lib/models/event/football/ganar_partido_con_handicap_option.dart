class GanarPartidoConHandicapOption {

  double homeHandicap ;
  double coeffHomeHandicap ;
  bool showH;
  double awayHandicap ;
  double coeffAwayHandicap ;
  bool showA;


  GanarPartidoConHandicapOption.fromMap(Map<String, dynamic> map) :
    homeHandicap = map['homeHandicap'],
    coeffHomeHandicap = map['coeffHomeHandicap'],
    showH = map['showH'],
    awayHandicap = map['awayHandicap'],
    coeffAwayHandicap = map['coeffAwayHandicap'],
    showA = map['showA'];

}

