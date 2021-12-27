import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/models/search_event_dto.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class GetEventService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/events';

  Future<EventResponse> events(List<String> eventIds, int page, int size) async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}?token=${sessionId}&page=${page}&size=${size}' ;
    SearchEventDto searchEventDto = SearchEventDto(eventIds) ;
    GenericResponse response = await restClientService.post(uri, searchEventDto.toMap()) ;
    return _gamesResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  EventResponse _gamesResponseFromJson(int statusCode, String message, String json) {
    var eventResponse = new EventResponse();
    eventResponse.statusCode = statusCode;
    eventResponse.message = message;
    eventResponse.events = (json != null) ? (jsonDecode(json) as List).map((event) => Event.fromMap(event)).toList() : [];
    return eventResponse ;
  }

}