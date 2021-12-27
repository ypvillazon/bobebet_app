import 'dart:async';
import 'dart:convert';
import 'package:bobebet_app/models/bet.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class GetBetsService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/bets';

  Future<BetsResponse> bets(int page, int size) async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}?token=${sessionId}&page=${page}&size=${size}' ;
    GenericResponse response = await restClientService.get(uri) ;
    return _betsResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  BetsResponse _betsResponseFromJson(int statusCode, String message, String json) {
    var betsResponse = new BetsResponse();
    betsResponse.statusCode = statusCode;
    betsResponse.message = message;
    betsResponse.bets = ((json != null) ? (jsonDecode(json) as List).map((bet) => Bets.fromJson(bet)).toList() : []).cast<Bets>()  ;
    return betsResponse ;
  }

}