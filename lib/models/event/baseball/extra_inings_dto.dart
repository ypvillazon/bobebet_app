
class ExtraIningsDto {
  bool available ;
  String title ;
  String optionSi ;
  double optionCoeffSi ;
  String optionNo ;
  double optionCoeffNo ;

  ExtraIningsDto.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    optionSi = map['optionSi'],
    optionCoeffSi = map['optionCoeffSi'],
    optionNo = map['optionNo'],
    optionCoeffNo = map['optionCoeffNo'];

}