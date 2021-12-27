import 'dart:async';
import 'dart:convert';
import 'package:bobebet_app/models/bet_stats.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class GetBetStatsService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/bets/all';

  Future<BetStatsResponse> stats(page, size) async {
    String sessionId = await Prefs.sessionId ;
    String userSessionId = await Prefs.sessionUserId ;

    var uri = '${PATH}?token=${sessionId}&all=${(userSessionId == "aaaa.bbbb.cccc") ? true : false}&page=${page}&page=${size}' ;
    GenericResponse response = await restClientService.get(uri) ;
    return _betStatsResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  BetStatsResponse _betStatsResponseFromJson(int statusCode, String message, String json) {
    var betStatsResponse = new BetStatsResponse();
    betStatsResponse.statusCode = statusCode;
    betStatsResponse.message = message;
    betStatsResponse.betStatsList = (json != null) ? (jsonDecode(json) as List).map((betSummaryStatsByUser) => BetStats.fromMap(betSummaryStatsByUser)).toList() : []  ;
    return betStatsResponse ;
  }

}