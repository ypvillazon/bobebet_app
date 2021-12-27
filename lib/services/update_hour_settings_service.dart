import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/users.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';

class UpdateHourSettingsService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/hour/configuration/update';

  Future<GenericResponse> update(int hours, int statsHours) async {
    String sessionId = await Prefs.sessionId;
    var uri = '${PATH}?token=${sessionId}&hours=${hours}&statsHours=${statsHours}' ;
    return await restClientService.post(uri, "") ;
  }
}