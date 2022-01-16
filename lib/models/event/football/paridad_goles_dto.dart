import 'dart:convert';

class ParidadGolesDto {

  late bool available;
  late String title ;
  late double coeffPar ;
  late double coeffImpar ;

  ParidadGolesDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      available = map['available'];
      title = map['title'];
      coeffPar = map['coeffPar'];
      coeffImpar = map['coeffImpar'];
    }
  }

  String toJson() {
    var map = new Map();
    map["available"] = available;
    map["title"] = title;
    map["coeffPar"] = coeffPar;
    map["coeffImpar"] = coeffImpar;
    String json = jsonEncode(map);
    return json;
  }

}