
class BasketMitadConMasPuntosDto {
  bool available ;
  String title ;
  String optionMitad1 ;
  double coeffMitad1 ;
  String optionMitad2 ;
  double coeffMitad2 ;

  BasketMitadConMasPuntosDto.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    optionMitad1 = map['optionMitad1'],
    coeffMitad1 = map['coeffMitad1'],
    optionMitad2 = map['optionMitad2'],
    coeffMitad2 = map['coeffMitad2'];

}