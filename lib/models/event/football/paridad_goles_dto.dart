
import 'dart:convert';

class ParidadGolesDto {

  bool available;
  String title ;
  double coeffPar ;
  double coeffImpar ;

  ParidadGolesDto.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    coeffPar = map['coeffPar'],
    coeffImpar = map['coeffImpar'];


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