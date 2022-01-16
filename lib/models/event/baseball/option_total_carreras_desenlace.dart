
class OptionTotalCarrerasDesenlace {

  late double carrerasMenos ;
  late double coeffMenos ;
  late  bool showMenos ;
  late   double carrerasMas ;
  late   double coeffMas ;
  late  bool showMas ;

  OptionTotalCarrerasDesenlace.fromMap(Map<String, dynamic> map) {
    carrerasMenos = map['carrerasMenos'];
    coeffMenos = map['coeffMenos'];
    showMenos = map['showMenos'];
    carrerasMas = map['carrerasMas'];
    coeffMas = map['coeffMas'];
    showMas = map['showMas'];
  }

}