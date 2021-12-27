
import 'dart:convert';

class CarrerasPorEntradasDto {

  bool available;
  String title ;
  String h ;
  String d ;
  String a ;
  double hCoeff ;
  double lastHCoeff;
  int hcoeffUp;

  double dCoeff ;
  double lastDCoeff ;
  int dcoeffUp;

  double aCoeff ;
  double lastACoeff ;
  int acoeffUp;


  CarrerasPorEntradasDto.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    h = map['h'],
    d = map['d'],
    a = map['a'],
    hCoeff = map['hcoeff'],
    lastHCoeff = map['lastHCoeff'],
    hcoeffUp = map['hcoeffUp'],
    dCoeff = map['dcoeff'],
    lastDCoeff = map['lastDCoeff'],
    dcoeffUp = map['dcoeffUp'],
    aCoeff = map['acoeff'],
    lastACoeff = map['lastACoeff'],
    acoeffUp = map['acoeffUp'];


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