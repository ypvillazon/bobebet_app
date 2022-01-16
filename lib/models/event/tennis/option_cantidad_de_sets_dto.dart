
class OptionCantidadDeSetsDto {

  late int sets ;
  late double coeff ;

  OptionCantidadDeSetsDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      sets = map['sets'];
      coeff = map['coeff'];
    }
  }

}