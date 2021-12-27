import 'package:bobebet_app/models/activation.dart';
import 'dart:async';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class ActivateAccountService {

  RestClientService restClientService = RestClientService() ;
  String PATH = '/api/bet/account/verify' ;

  Future<ActivationAccountResponse> activationAccount(String verificationCode) async {
    var uri = '${PATH}?verificationCode=${verificationCode}' ;
    GenericResponse response = await restClientService.get(uri);

    ActivationAccountResponse activationAccountResponse = new ActivationAccountResponse();
    activationAccountResponse.statusCode = response.statusCode;
    activationAccountResponse.message = response.message;
    activationAccountResponse.activationCode = response.data;

    return activationAccountResponse;
  }
}
