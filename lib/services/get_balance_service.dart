import 'dart:async';
import 'dart:convert';
import 'package:bobebet_app/models/operation.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class GetBalanceService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/users/credit/operations';

  Future<OperationResponse> operations(int page, int size) async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}?token=${sessionId}&page=${page}&size=${size}' ;
    GenericResponse response = await restClientService.get(uri) ;
    return _operationResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  OperationResponse _operationResponseFromJson(int statusCode, String message, String json) {
    var operationResponse = new OperationResponse();
    operationResponse.statusCode = statusCode;
    operationResponse.message = message;
    operationResponse.operations = (json != null) ? (jsonDecode(json) as List).map((bet) => Operation.fromMap(bet)).toList() : []  ;
    return operationResponse ;
  }

}