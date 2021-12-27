
class OptionTotalCarrerasDesenlace {

  double carrerasMenos ;
  double coeffMenos ;
  bool showMenos ;
  double carrerasMas ;
  double coeffMas ;
  bool showMas ;

  OptionTotalCarrerasDesenlace.fromMap(Map<String, dynamic> map) :
    carrerasMenos = map['carrerasMenos'],
    coeffMenos = map['coeffMenos'],
    showMenos = map['showMenos'],
    carrerasMas = map['carrerasMas'],
    coeffMas = map['coeffMas'],
    showMas = map['showMas'];

}