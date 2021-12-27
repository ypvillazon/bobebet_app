import 'dart:async';
import 'dart:convert';
import 'package:bobebet_app/models/bet_summary_stats_by_user.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class GetBetSummaryStatsByUserService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/bets/stats/by/user';

  Future<BetSummaryStatsByUserResponse> stats() async {
    String sessionId = await Prefs.sessionId ;
    String userSessionId = await Prefs.sessionUserId ;
    var uri = '${PATH}?token=${sessionId}&all=${(userSessionId == "aaaa.bbbb.cccc") ? true : false}' ;
    GenericResponse response = await restClientService.get(uri) ;
    return _betSummaryStatsByUserResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  BetSummaryStatsByUserResponse _betSummaryStatsByUserResponseFromJson(int statusCode, String message, String json) {
    var betSummaryStatsByUserResponse = new BetSummaryStatsByUserResponse();
    betSummaryStatsByUserResponse.statusCode = statusCode;
    betSummaryStatsByUserResponse.message = message;
    betSummaryStatsByUserResponse.betSummaryStatsByUsers = (json != null) ? (jsonDecode(json) as List).map((betSummaryStatsByUser) => BetSummaryStatsByUser.fromMap(betSummaryStatsByUser)).toList() : []  ;
    return betSummaryStatsByUserResponse ;
  }

}