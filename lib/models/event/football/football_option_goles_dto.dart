
class OptionGolesDto {

  String option;
  String code ;
  double coeffSi ;
  double coeffNo ;
  bool showSi;
  bool showNo;

  OptionGolesDto.fromMap(Map<String, dynamic> map) :
    option = map['option'],
    code = map['code'],
    coeffSi = map['coeffSi'],
    coeffNo = map['coeffNo'],
    showSi = map['showSi'],
    showNo = map['showNo'];

}