import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class GetOneEventService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/event';

  Future<OneEventResponse> get(String eventId) async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}/${eventId}?token=${sessionId}' ;
    GenericResponse response = await restClientService.get(uri) ;
    return _oneEventResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  OneEventResponse _oneEventResponseFromJson(int statusCode, String message, String json) {
    var oneEventResponse = new OneEventResponse();
    oneEventResponse.statusCode = statusCode;
    oneEventResponse.message = message;
    if ((json != null)) {
      oneEventResponse.event = Event.fromMap(jsonDecode(json));
    } else {
      oneEventResponse.event = [] as Event;
    }
    return oneEventResponse ;
  }

}