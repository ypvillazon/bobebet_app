class ApuestaAResultadoOptionDto {
  late String resultado ;
  late double coeff ;

  ApuestaAResultadoOptionDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      resultado = map['resultado'];
      coeff = map['coeff'];
    }
  }


}