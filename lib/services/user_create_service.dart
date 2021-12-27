import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/users.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class UserCreateService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/account/register';

  Future<GenericResponse> create(String? parentUserId, UserAdd userAdd) async {
    String sessionId = await Prefs.sessionId;
    var uri = '${PATH}?token=${sessionId}&parentUserId=${parentUserId}' ;
    return await restClientService.post(uri, _gestorUserToJson(userAdd)) ;
  }

  String _gestorUserToJson(UserAdd userAdd) {
    var map = new Map();
    map["name"] = (userAdd == null) ? "" : userAdd.name;
    map["email"] = (userAdd == null) ? "" : userAdd.email;
    map["role"] = (userAdd == null) ? "" : userAdd.role;
    map["credit"] = double.parse((userAdd == null) ? "0" : userAdd.credit);
    map["minBetCredit"] = double.parse((userAdd == null) ? "0" : userAdd.minBetCredit);
    map["bankWonPercent"] = double.parse((userAdd == null) ? "0" : userAdd.bankWonPercent);
    map["userWonPercent"] = double.parse((userAdd == null) ? "0" : userAdd.userWonPercent);
    map["minCredit"] = double.parse((userAdd == null) ? "0" : userAdd.minCredit);
    String json = jsonEncode(map);
    return json;
  }

}