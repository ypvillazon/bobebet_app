
class OptionTotalCompletedRoundsDosDesenlacesDto {

  double puntosMenos ;
  double coeffMenos ;
  bool showMenos ;

  double puntosMas ;
  double coeffMas ;
  bool showMas ;

  OptionTotalCompletedRoundsDosDesenlacesDto.fromMap(Map<String, dynamic> map) :
    puntosMenos = map['puntosMenos'],
    coeffMenos = map['coeffMenos'],
    showMenos = map['showMenos'],
    puntosMas = map['puntosMas'],
    coeffMas = map['coeffMas'],
    showMas = map['showMas'];

}