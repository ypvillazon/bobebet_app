import 'package:bobebet_app/models/change_first_password.dart';
import 'dart:async';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class RestorePasswordService {

  RestClientService restClientService = RestClientService() ;
  String PATH = '/api/bet/account/restore-password' ;

  Future<ChangeFirstPasswordResponse> change(String resetPasswordCode, String password) async {
    var uri = '${PATH}?resetPasswordCode=${resetPasswordCode}&password=${password}' ;
    GenericResponse response = await restClientService.post(uri, "");
    ChangeFirstPasswordResponse  changeFirstPasswordResponse = new ChangeFirstPasswordResponse();
    changeFirstPasswordResponse.statusCode = response.statusCode;
    changeFirstPasswordResponse.message = response.message;
    return changeFirstPasswordResponse;
  }
}
