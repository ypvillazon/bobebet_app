import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/models/search_event_dto.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class GetConcludeEventService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/events/conclude';

  Future<GenericResponse> conclude(String eventId, String teamName) async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}?token=${sessionId}&eventId=${eventId}&teamName=${teamName}' ;
    return await restClientService.get(uri) ;
  }
}