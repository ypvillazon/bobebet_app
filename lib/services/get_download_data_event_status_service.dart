import 'dart:async';
import 'dart:convert';
import 'package:bobebet_app/models/downlaod_data_event_status_dto.dart';
import 'package:bobebet_app/preference/prefs.dart';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class GetDownlaodDataEventStatusDtoService {

  RestClientService restClientService = RestClientService() ;
  final PATH = '/api/bet/events/download/status';

  Future<DownlaodDataEventStatusDtoResponse> downlaodDataEvents(int page, int size) async {
    String sessionId = await Prefs.sessionId ;
    var uri = '${PATH}?token=${sessionId}&page=${page}&size=${size}' ;
    GenericResponse response = await restClientService.get(uri) ;
    return _downlaodDataEventStatusDtoResponseFromJson(response.statusCode, response.message, (response.statusCode==0) ? response.data : null);
  }

  DownlaodDataEventStatusDtoResponse _downlaodDataEventStatusDtoResponseFromJson(int statusCode, String message, String json) {
    var downlaodDataEventStatusDtoResponse = new DownlaodDataEventStatusDtoResponse();
    downlaodDataEventStatusDtoResponse.statusCode = statusCode;
    downlaodDataEventStatusDtoResponse.message = message;
    downlaodDataEventStatusDtoResponse.downlaodDataEventStatusDtos = ((json != null) ? (jsonDecode(json) as List).map((downlaodDataEventStatusDto) => DownlaodDataEventStatusDto.fromJson(downlaodDataEventStatusDto)).toList() : []).cast<DownlaodDataEventStatusDto>()  ;
    return downlaodDataEventStatusDtoResponse ;
  }

}