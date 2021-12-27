import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/users.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class DeleteFavoriteEventService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/favorite';

  Future<GenericResponse> delete(String eventId) async {
    String sessionId = await Prefs.sessionId;
    var uri = '${PATH}/${eventId}?token=${sessionId}' ;
    return await restClientService.delete(uri) ;
  }

}