import 'dart:async';
import 'dart:convert';
import 'package:bobebet_app/models/hour_configuration.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class GetHourSettingsService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/hour/configuration/get';

  Future<HourConfigurationResponse> get() async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}?token=${sessionId}' ;
    GenericResponse response = await restClientService.post(uri, "") ;
    print(response.statusCode);
    return _hourConfigurationResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  HourConfigurationResponse _hourConfigurationResponseFromJson(int statusCode, String message, String json) {
    var hourConfigurationResponse = new HourConfigurationResponse();
    hourConfigurationResponse.statusCode = statusCode;
    hourConfigurationResponse.message = message;
    hourConfigurationResponse.hourConfiguration = ((json != null) ? HourConfiguration.fromMap(jsonDecode(json)) : null)!;
    return hourConfigurationResponse ;
  }

}