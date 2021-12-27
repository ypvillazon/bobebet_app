import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/users.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class UserUpdateService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/account/update';

  Future<GenericResponse> update(UserUpdate userUpdate) async {
    String sessionId = await Prefs.sessionId;
    var uri = '${PATH}?token=${sessionId}' ;
    return await restClientService.post(uri, _userUpdateToJson(userUpdate)) ;
  }

  String _userUpdateToJson(UserUpdate userUpdate) {
    var map = new Map();
    map["id"] = userUpdate.id;
    map["bankWonPercent"] = double.parse(userUpdate.bankWonPercent);
    map["minBetCredit"] = double.parse(userUpdate.minBetCredit);
    map["minCredit"] = double.parse(userUpdate.minCredit);
    map["userWonPercent"] = double.parse(userUpdate.userWonPercent);
    map["credit"] = double.parse(userUpdate.credit);
    map["minCreditForBetByEvent"] = double.parse(userUpdate.minCreditForBetByEvent);
    String json = jsonEncode(map);
    return json;
  }

}