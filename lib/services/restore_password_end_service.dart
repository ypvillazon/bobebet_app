import 'package:bobebet_app/models/activation.dart';
import 'package:bobebet_app/models/change_first_password.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'dart:async';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class RestorePasswordEndService {

  RestClientService restClientService = RestClientService() ;
  String PATH = '/api/bet/account/restore-password-end' ;

  Future<ChangeFirstPasswordResponse> change(String resetPasswordCode) async {
    var uri = '${PATH}?resetPasswordCode=${resetPasswordCode}' ;
    GenericResponse response = await restClientService.post(uri, "");

    ChangeFirstPasswordResponse  changeFirstPasswordResponse = new ChangeFirstPasswordResponse();
    changeFirstPasswordResponse.statusCode = response.statusCode;
    changeFirstPasswordResponse.message = response.message;

    return changeFirstPasswordResponse;
  }
}
