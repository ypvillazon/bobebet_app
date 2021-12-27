import 'package:bobebet_app/models/activation.dart';
import 'package:bobebet_app/models/change_first_password.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'dart:async';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class RestorePasswordInitService {

  RestClientService restClientService = RestClientService() ;
  String PATH = '/api/bet/account/restore-password-init' ;

  Future<ChangeFirstPasswordResponse> change(String email) async {
    var uri = '${PATH}?email=${email}' ;
    GenericResponse response = await restClientService.post(uri, "");
    ChangeFirstPasswordResponse  changeFirstPasswordResponse = new ChangeFirstPasswordResponse();
    changeFirstPasswordResponse.statusCode = response.statusCode;
    changeFirstPasswordResponse.message = response.message;
    return changeFirstPasswordResponse;
  }
}
