
class OptionCantidadDeSetsDto {

  int sets ;
  double coeff ;

  OptionCantidadDeSetsDto.fromMap(Map<String, dynamic> map) :
    sets = map['sets'],
    coeff = map['coeff'];


}