import 'dart:async';
import 'dart:convert';
import 'package:bobebet_app/models/event_filters.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class GetEventFiltersService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/events/filters';

  Future<EventFilterResponse> eventFilters() async {
    String token = await Prefs.sessionId ;
    var uri = '${PATH}?token=${token}' ;
    GenericResponse response = await restClientService.get(uri) ;
    return _eventFilterResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  EventFilterResponse _eventFilterResponseFromJson(int statusCode, String message, String json) {
    var eventFilterResponse = new EventFilterResponse();
    eventFilterResponse.statusCode = statusCode;
    eventFilterResponse.message = message;
    eventFilterResponse.eventFilters = (json != null) ? (jsonDecode(json) as List).map((eventFilter) => EventFilter.fromMap(eventFilter)).toList() : [];
    return eventFilterResponse ;
  }

}