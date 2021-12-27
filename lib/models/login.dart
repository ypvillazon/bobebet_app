
import 'dart:convert';

class Login {

  late String email;
  late String password;

  Login();

  String toJson() {
    var map = new Map();
    map["email"] = email;
    map["password"] = password;
    String json = jsonEncode(map);
    return json;
  }

}




