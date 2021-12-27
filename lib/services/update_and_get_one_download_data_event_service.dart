import 'dart:async';
import 'dart:convert';

import 'package:bobebet_app/models/downlaod_data_event_status_dto.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class UpdateAndGetOneDownloadDataService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/events/download/update';

  Future<DownlaodOneDataEventStatusDtoResponse> update(String eventId) async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}?token=${sessionId}&eventId=${eventId}' ;
    GenericResponse response = await restClientService.get(uri) ;
    return _downlaodOneDataEventStatusDtoResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  DownlaodOneDataEventStatusDtoResponse _downlaodOneDataEventStatusDtoResponseFromJson(int statusCode, String message, String json) {
    var downlaodOneDataEventStatusDtoResponse = new DownlaodOneDataEventStatusDtoResponse();
    downlaodOneDataEventStatusDtoResponse.statusCode = statusCode;
    downlaodOneDataEventStatusDtoResponse.message = message;
    if ((json != null)) {
      downlaodOneDataEventStatusDtoResponse.downlaodDataEventStatusDto = DownlaodDataEventStatusDto.fromJson(jsonDecode(json));
    } else {
      downlaodOneDataEventStatusDtoResponse.downlaodDataEventStatusDto = [] as DownlaodDataEventStatusDto;
    }
    return downlaodOneDataEventStatusDtoResponse ;
  }

}