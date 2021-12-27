import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/credit_manager.dart';
import 'package:bobebet_app/models/users.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class CreditManagerService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/users/credit';

  Future<GenericResponse> execute(CreditManager creditManager) async {
    String sessionId = await Prefs.sessionId;
    var uri = '${PATH}?token=${sessionId}' ;
    return await restClientService.post(uri, _creditManagerToJson(creditManager)) ;
  }

  String _creditManagerToJson(CreditManager creditManager) {
    var map = new Map();
    map["userId"] = creditManager.userId;
    map["operation"] = creditManager.operation;
    map["amount"] = creditManager.amount;
    String json = jsonEncode(map);
    return json;
  }

}