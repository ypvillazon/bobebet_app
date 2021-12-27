import 'package:bobebet_app/models/session.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/login.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';
import 'package:bobebet_app/preference/prefs.dart';

class LoginService {

  RestClientService restClientService = RestClientService() ;
  String PATH = '/api/bet/account/login' ;

  Future<SessionResponse> doLogin(Login login) async {
    GenericResponse response = await restClientService.post(PATH, login.toJson());
    return _sessionResponse(response.statusCode, response.message, (response.statusCode==0) ? Session.fromMap(jsonDecode(response.data)) : new Session());
  }

  SessionResponse _sessionResponse(int statusCode, String message, Session session) {
    var sessionResponse = new SessionResponse();
    sessionResponse.statusCode = statusCode;
    sessionResponse.message = message;
    sessionResponse.session = session ;
    return sessionResponse ;
  }


}
