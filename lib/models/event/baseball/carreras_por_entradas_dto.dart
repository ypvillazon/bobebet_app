
import 'dart:convert';

class CarrerasPorEntradasDto {

  late  bool available;
  late  String title ;
  late String h ;
  late String d ;
  late String a ;
  late double hCoeff ;
  late double lastHCoeff;
  late int hcoeffUp;

  late double dCoeff ;
  late double lastDCoeff ;
  late int dcoeffUp;

  late  double aCoeff ;
  late double lastACoeff ;
  late int acoeffUp;


  CarrerasPorEntradasDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      available = map['available'];
      title = map['title'];
      h = map['h'];
      d = map['d'];
      a = map['a'];
      hCoeff = map['hcoeff'];
      lastHCoeff = map['lastHCoeff'];
      hcoeffUp = map['hcoeffUp'];
      dCoeff = map['dcoeff'];
      lastDCoeff = map['lastDCoeff'];
      dcoeffUp = map['dcoeffUp'];
      aCoeff = map['acoeff'];
      lastACoeff = map['lastACoeff'];
      acoeffUp = map['acoeffUp'];
    }
  }


  String toJson() {
    var map = new Map();
    map["available"] = available;
    map["title"] = title;
    map["h"] = h;
    map["d"] = d;
    map["a"] = a;
    map["hCoeff"] = hCoeff;
    map["dCoeff"] = dCoeff;
    map["aCoeff"] = aCoeff;
    String json = jsonEncode(map);
    return json;
  }

}