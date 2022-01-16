
class FACuartoConMasPuntosDto {
  late bool available ;
  late String title ;
  late String optionCuarto1 ;
  late double coeffCuarto1 ;
  late String optionCuarto2 ;
  late double coeffCuarto2 ;
  late String optionCuarto3 ;
  late double coeffCuarto3 ;
  late String optionCuarto4 ;
  late double coeffCuarto4 ;

  FACuartoConMasPuntosDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      available = map['available'];
      title = map['title'];
      optionCuarto1 = map['optionCuarto1'];
      coeffCuarto1 = map['coeffCuarto1'];
      optionCuarto2 = map['optionCuarto2'];
      coeffCuarto2 = map['coeffCuarto2'];
      optionCuarto3 = map['optionCuarto3'];
      coeffCuarto3 = map['coeffCuarto3'];
      optionCuarto4 = map['optionCuarto4'];
      coeffCuarto4 = map['coeffCuarto4'];
    }
  }

}