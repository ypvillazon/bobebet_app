
class OptionTotalGolesTresDesenlaces {

  int golesMenos ;
  double golesCoeffMenos ;
  bool showMenos ;
  int golesExactamente ;
  double golesCoeffExactamente ;
  bool showExactamente ;
  int golesMas ;
  double golesCoeffMas ;
  bool showMas ;

  OptionTotalGolesTresDesenlaces.fromMap(Map<String, dynamic> map) :
    golesMenos = map['golesMenos'],
    golesCoeffMenos = map['golesCoeffMenos'],
    showMenos = map['showMenos'],
    golesExactamente = map['golesExactamente'],
    golesCoeffExactamente = map['golesCoeffExactamente'],
    showExactamente = map['showExactamente'],
    golesMas = map['golesMas'],
    golesCoeffMas = map['golesCoeffMas'],
    showMas = map['showMas'];


}