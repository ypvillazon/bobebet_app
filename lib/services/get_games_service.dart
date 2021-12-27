import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/models/event/events.dart';
import 'package:bobebet_app/models/search_event_dto.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class GetGameDataService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/events';

  Future<GameDataResponse> gameData(List<String> eventIds, int page, int size) async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}?token=${sessionId}&page=${page}&size=${size}' ;
    SearchEventDto searchEventDto = SearchEventDto(eventIds) ;
    print(searchEventDto.toMap());
    GenericResponse response = await restClientService.post(uri, searchEventDto.toMap()) ;
    return _gameDataResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  GameDataResponse _gameDataResponseFromJson(int statusCode, String message, String json) {
    var gameDataResponse = new GameDataResponse();
    gameDataResponse.statusCode = statusCode;
    gameDataResponse.message = message;
    gameDataResponse.gameData = ((json != null) ? _gameDataFromJson(json) : null)!  ;
    return gameDataResponse ;
  }

  Events _gameDataFromJson(String json) {
    var gameData = new Events();
    Map<String, dynamic> map = jsonDecode(json);
    gameData.events = (map['events'] != null) ? (map['events'] as List).map((event) => Event.fromMap(event)).toList() : [];
    gameData.credit = map['credit'] ;
    return gameData ;
  }


}