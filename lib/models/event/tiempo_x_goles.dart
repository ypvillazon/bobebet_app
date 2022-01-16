class TiempoPorGoles {
  late bool available ;
  late String title ;
  late String optionALabel ;
  late double optionACoeff ;
  late String optionBLabel ;
  late double optionBCoeff ;
  late String optionCLabel ;
  late double optionCCoeff ;

  TiempoPorGoles.fromMap(Map<String, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map != null) {
      available = map['available'];
      title = map['title'];
      optionALabel = map['optionALabel'];
      optionACoeff = map['optionACoeff'];
      optionBLabel = map['optionBLabel'];
      optionBCoeff = map['optionBCoeff'];
      optionCLabel = map['optionCLabel'];
      optionCCoeff = map['optionCCoeff'];
    }
  }

}