
class OptionTotalJuegosDto {

  late double puntosMenos ;
  late double coeffMenos ;
  late bool showMenos ;
  late double puntosMas ;
  late double coeffMas ;
  late bool showMas ;

  OptionTotalJuegosDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      puntosMenos = map['puntosMenos'];
      coeffMenos = map['coeffMenos'];
      showMenos = map['showMenos'];
      puntosMas = map['puntosMas'];
      coeffMas = map['coeffMas'];
      showMas = map['showMas'];
    }
  }


}