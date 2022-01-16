
class BasketMitadConMasPuntosDto {
  late bool available ;
  late  String title ;
  late  String optionMitad1 ;
  late double coeffMitad1 ;
  late  String optionMitad2 ;
  late double coeffMitad2 ;

  BasketMitadConMasPuntosDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      available = map['available'];
      title = map['title'];
      optionMitad1 = map['optionMitad1'];
      coeffMitad1 = map['coeffMitad1'];
      optionMitad2 = map['optionMitad2'];
      coeffMitad2 = map['coeffMitad2'];
    }
  }

}