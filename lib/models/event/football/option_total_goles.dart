
class OptionTotalGoles {

  double golesMenos ;
  double coeffMenos ;
  bool showMenos ;
  double golesMas ;
  double coeffMas ;
  bool showMas ;

  OptionTotalGoles.fromMap(Map<String, dynamic> map) :
    golesMenos = map['golesMenos'],
    coeffMenos = map['coeffMenos'],
    showMenos = map['showMenos'],
    golesMas = map['golesMas'],
    coeffMas = map['coeffMas'],
    showMas = map['showMas'];


}