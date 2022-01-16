class BasketOptionMargenDeVictoriaDto {
  late String option ;
  late double coeffH ;
  late double coeffA ;

  BasketOptionMargenDeVictoriaDto.fromMap(Map<String, dynamic> map) {
    option = map['option'];
    coeffH = map['coeffH'];
    coeffA = map['coeffA'];
  }

}