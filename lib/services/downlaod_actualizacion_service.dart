import 'dart:async';
import 'package:bobebet_app/services/common/rest_client_service.dart';


class DownloadActualizacionService {

  RestClientService restClientService = RestClientService() ;
  String PATH = '/api/version/app/downloaded' ;

  Future<GenericResponse> download(v) async {
    var uri = '${PATH}?versionName=${v}' ;
    GenericResponse response = await restClientService.get(uri);
    return response;
  }
}
