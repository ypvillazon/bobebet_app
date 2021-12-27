import 'dart:async';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class CreateFavoriteEventService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/favorite';

  Future<GenericResponse> create(String eventId) async {
    String sessionId = await Prefs.sessionId;
    var uri = '${PATH}?token=${sessionId}&eventId=${eventId}' ;
    return await restClientService.post(uri, "") ;
  }

}