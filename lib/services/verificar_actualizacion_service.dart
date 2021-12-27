import 'dart:convert';
import 'package:bobebet_app/models/actualizacion.dart';
import 'dart:async';
import 'package:bobebet_app/services/common/rest_client_service.dart';
import 'package:bobebet_app/configuration/configuration.dart';


class VerificarActualizacionService {

  RestClientService restClientService = RestClientService() ;
  String PATH = '/api/version/app?versionName=${VERSION}' ;

  Future<ActualizacionResponse> check() async {
    var uri = '${PATH}' ;
    GenericResponse response = await restClientService.get(uri);
    return _actualizacionResponseFromJson(response.statusCode, response.message, response.data);
  }

  ActualizacionResponse _actualizacionResponseFromJson(int statusCode, String message, String json) {
    var actualizacionResponse = new ActualizacionResponse();
    actualizacionResponse.statusCode = statusCode;
    actualizacionResponse.message = message;
    print("ERROR: " + json);
    // ignore: unnecessary_null_comparison
    if ((json != null)) {
      actualizacionResponse.actualizacion = Actualizacion.fromMap(jsonDecode(json));
    } else {
      actualizacionResponse.actualizacion = [] as Actualizacion;
    }
    return actualizacionResponse ;
  }

}
