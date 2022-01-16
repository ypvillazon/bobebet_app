
class OptionTotalGoles {

  late double golesMenos ;
  late double coeffMenos ;
  late bool showMenos ;
  late double golesMas ;
  late double coeffMas ;
  late bool showMas ;

  OptionTotalGoles.fromMap(Map<String, dynamic> map) {
    golesMenos = map['golesMenos'];
    coeffMenos = map['coeffMenos'];
    showMenos = map['showMenos'];
    golesMas = map['golesMas'];
    coeffMas = map['coeffMas'];
    showMas = map['showMas'];
  }
}