
class OptionGolesDto {

  late String option;
  late  String code ;
  late double coeffSi ;
  late  double coeffNo ;
  late bool showSi;
  late bool showNo;

  OptionGolesDto.fromMap(Map<String, dynamic> map) {
    option = map['option'];
    code = map['code'];
    coeffSi = map['coeffSi'];
    coeffNo = map['coeffNo'];
    showSi = map['showSi'];
    showNo = map['showNo'];
  }

}