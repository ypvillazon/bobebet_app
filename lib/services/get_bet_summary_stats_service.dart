import 'dart:async';
import 'dart:convert';
import 'package:bobebet_app/models/stats/bet_summary_stats.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class GetBetSummaryStatsService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/bets/stats';

  Future<BetSummaryStatsResponse> stats(int page, int size, StatsType statsType) async {
    String sessionId = await Prefs.sessionId ;
    String userSessionId = await Prefs.sessionUserId ;
    var uri = '${PATH}?token=${sessionId}&all=${(userSessionId == "aaaa.bbbb.cccc") ? true : false}&page=${page}&size=${size}&type=${statsType.toString().split(".")[1]}' ;
    GenericResponse response = await restClientService.get(uri) ;
    return _betSummaryStatsResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  BetSummaryStatsResponse _betSummaryStatsResponseFromJson(int statusCode, String message, String json) {
    var betSummaryStatsResponse = new BetSummaryStatsResponse();
    betSummaryStatsResponse.statusCode = statusCode;
    betSummaryStatsResponse.message = message;
    betSummaryStatsResponse.betSummaryStats = (json != null) ? (jsonDecode(json) as List).map((betSummaryStats) => BetSummaryStats.fromMap(betSummaryStats)).toList() : []  ;
    return betSummaryStatsResponse ;
  }

}

enum StatsType {
  BY_SPORT,
  BY_SPORT_AND_DAY,
  BY_SPORT_AND_MONTH,
  BY_TYPES_AND_MONTH,
  BY_EVENT_AND_MONTH,
  BY_MONTH,
  BY_YEAR,
  BY_TYPES_DAY,
  BY_EVENT_DAY,
  BY_DAY
}