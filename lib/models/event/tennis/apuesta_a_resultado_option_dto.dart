class ApuestaAResultadoOptionDto {
  String resultado ;
  double coeff ;

  ApuestaAResultadoOptionDto.fromMap(Map<String, dynamic> map) :
    resultado = map['resultado'],
    coeff = map['coeff'];


}