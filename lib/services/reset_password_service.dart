import 'package:bobebet_app/models/change_first_password.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'dart:async';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class ResetPasswordService {

  RestClientService restClientService = RestClientService() ;
  String PATH = '/api/bet/account/change-password' ;

  Future<ChangeFirstPasswordResponse> change(String password) async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}?sessionId=${sessionId}&password=${password}' ;
    GenericResponse response = await restClientService.post(uri, "");

    ChangeFirstPasswordResponse  changeFirstPasswordResponse = new ChangeFirstPasswordResponse();
    changeFirstPasswordResponse.statusCode = response.statusCode;
    changeFirstPasswordResponse.message = response.message;

    return changeFirstPasswordResponse;
  }
}
