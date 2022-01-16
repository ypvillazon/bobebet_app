
class ExtraIningsDto {
  late bool available ;
  late String title ;
  late String optionSi ;
  late  double optionCoeffSi ;
  late String optionNo ;
  late double optionCoeffNo ;

  ExtraIningsDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      available = map['available'];
      title = map['title'];
      optionSi = map['optionSi'];
      optionCoeffSi = map['optionCoeffSi'];
      optionNo = map['optionNo'];
      optionCoeffNo = map['optionCoeffNo'];
    }
  }

}