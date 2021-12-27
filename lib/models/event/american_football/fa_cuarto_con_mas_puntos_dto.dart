
class FACuartoConMasPuntosDto {
  bool available ;
  String title ;
  String optionCuarto1 ;
  double coeffCuarto1 ;
  String optionCuarto2 ;
  double coeffCuarto2 ;
  String optionCuarto3 ;
  double coeffCuarto3 ;
  String optionCuarto4 ;
  double coeffCuarto4 ;

  FACuartoConMasPuntosDto.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    optionCuarto1 = map['optionCuarto1'],
    coeffCuarto1 = map['coeffCuarto1'],
    optionCuarto2 = map['optionCuarto2'],
    coeffCuarto2 = map['coeffCuarto2'],
    optionCuarto3 = map['optionCuarto3'],
    coeffCuarto3 = map['coeffCuarto3'],
    optionCuarto4 = map['optionCuarto4'],
    coeffCuarto4 = map['coeffCuarto4'];

}