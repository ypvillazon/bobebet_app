class BasketOptionMargenDeVictoriaDto {
  String option ;
  double coeffH ;
  double coeffA ;

  BasketOptionMargenDeVictoriaDto.fromMap(Map<String, dynamic> map) :
    option = map['option'],
    coeffH = map['coeffH'],
    coeffA = map['coeffA'];

}