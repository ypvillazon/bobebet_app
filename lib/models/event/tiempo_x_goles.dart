class TiempoPorGoles {
  bool available ;
  String title ;
  String optionALabel ;
  double optionACoeff ;
  String optionBLabel ;
  double optionBCoeff ;
  String optionCLabel ;
  double optionCCoeff ;

  TiempoPorGoles.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    optionALabel = map['optionALabel'],
    optionACoeff = map['optionACoeff'],
    optionBLabel = map['optionBLabel'],
    optionBCoeff = map['optionBCoeff'],
    optionCLabel = map['optionCLabel'],
    optionCCoeff = map['optionCCoeff'];

}