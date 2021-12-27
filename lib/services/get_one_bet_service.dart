import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/bet.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class GetOneBetService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/bets';

  Future<OneBetResponse> get(String betId) async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}/${betId}?token=${sessionId}' ;
    GenericResponse response = await restClientService.get(uri) ;
    return _oneBetResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  OneBetResponse _oneBetResponseFromJson(int statusCode, String message, String json) {
    var oneBetResponse = new OneBetResponse();
    oneBetResponse.statusCode = statusCode;
    oneBetResponse.message = message;
    if ((json== null)) {
      oneBetResponse.bet = Bets.fromJson(jsonDecode(json));
    } else {
      oneBetResponse.bet = [] as Bets;
    }
    return oneBetResponse ;
  }

}