import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:bobebet_app/configuration/configuration.dart';

class RestClientService {

  final _headers = {
    'Content-Type': 'application/json',
    'versionApp': VERSION,
    'securityToken': S_TOKEN,
  };

  Future<GenericResponse> post(String path, String json) async {
    try {
      final String URI = '${BASE}${path}' ;
      print('${URI}') ;
      final response =  await http.post(Uri.parse(URI), headers: _headers, body: json).timeout(Duration(seconds: 60)) ;
      if(response.statusCode >= 200 && response.statusCode <= 299 ) {
        return _genericResponseFromJson(0, "", response.body);
      } else {
        if(response.statusCode == 401 || response.statusCode == 403) {
          return _genericResponseFromJson(99, "El token utilizado no tiene permisos.", null);
        } else {
          if (response.statusCode == 461) {
            return _genericResponseFromJson(
                461, "Ha caducado la versión utilizada de la aplicación.", null);
          } else {
            if(response.statusCode == 400) {
              return _genericResponseFromJson(1, response.body, null);
            }
          }
        }
      }
    } catch (e) {
      if(e.toString().contains("No route to host") || e.toString().contains("No address associated with hostname")) {
        return _genericResponseFromJson(1, "Consulte la conexión de datos o wifi de su dispositivo, no es posible conectarse con el servidor.", null);
      } else {
        if(e.toString().contains("Connection refused") || e.toString().contains("Network is unreachable")) {
          return _genericResponseFromJson(1, "No es posible conectarse con el servidor. Contacte con los desarrolladores.", null);
        } else {
          return _genericResponseFromJson(1, 'Error interno. Contacte con los desarrolladores. Detalles: ${e.toString()}', null);
        }
      }
    }
    return _genericResponseFromJson(1, "Ha ocurrido un error interno. Contacte con los desarrolladores.", null);
  }

  Future<GenericResponse> get(String path) async {
    final String URI = '${BASE}${path}' ;
    print('${URI}') ;
    try {
      final response =  await http.get(Uri.parse(URI), headers: _headers).timeout(Duration(seconds: 60));
      print('response.statusCode: ${response.statusCode}');
      if(response.statusCode == 200) {
        return _genericResponseFromJson(0, "", response.body);
      } else {
        if(response.statusCode == 401 || response.statusCode == 403) {
          return _genericResponseFromJson(99, "El token utilizado no tiene permisos.", null);
        } else {
          if (response.statusCode == 461) {
            return _genericResponseFromJson(
                461, "Ha caducado la versión utilizada de la aplicación.", null);
          } else {
            if(response.statusCode == 400) {
              return _genericResponseFromJson(1, response.body, null);
            }
          }
        }
      }
    } catch (e) {
      if(e.toString().contains("No route to host") || e.toString().contains("No address associated with hostname")) {
        return _genericResponseFromJson(1, "Consulte la conexión de datos o wifi de su dispositivo, no es posible conectarse con el servidor.", null);
      } else {
        if(e.toString().contains("Connection refused") || e.toString().contains("Network is unreachable") || e.toString().contains("Connection timed out")) {
          return _genericResponseFromJson(1, "No es posible conectarse con el servidor. Contacte con los desarrolladores.", null);
        } else {
          return _genericResponseFromJson(1, 'Error interno. Contacte con los desarrolladores. Detalles: ${e.toString()}', null);
        }
      }
    }
    return _genericResponseFromJson(1, "Ha ocurrido un error interno. Contacte con los desarrolladores.", null);
  }

  Future<GenericResponse> delete(String path) async {
    try {
      final String URI = '${BASE}${path}' ;
      print('${URI}') ;
      final response =  await http.delete(Uri.parse(URI), headers: _headers).timeout(Duration(seconds: 60)) ;
      if(response.statusCode == 200) {
        return _genericResponseFromJson(0, "", response.body);
      } else {
        if(response.statusCode == 401 || response.statusCode == 403) {
          return _genericResponseFromJson(99, "El token utilizado no tiene permisos.", null);
        } else {
          if (response.statusCode == 461) {
            return _genericResponseFromJson(
                461, "Ha caducado la versión utilizada de la aplicación.", null);
          } else {
            if(response.statusCode == 400) {
              return _genericResponseFromJson(1, response.body, null);
            }
          }
        }
      }
    } catch (e) {
      if(e.toString().contains("No route to host") || e.toString().contains("No address associated with hostname")) {
        return _genericResponseFromJson(1, "Consulte la conexión de datos o wifi de su dispositivo, no es posible conectarse con el servidor.", null);
      } else {
        if(e.toString().contains("Connection refused") || e.toString().contains("Network is unreachable")) {
          return _genericResponseFromJson(1, "No es posible conectarse con el servidor. Contacte con los desarrolladores.", null);
        } else {
          return _genericResponseFromJson(1, 'Error interno. Contacte con los desarrolladores. Detalles: ${e.toString()}', null);
        }
      }
    }
    return _genericResponseFromJson(1, "Ha ocurrido un error interno. Contacte con los desarrolladores.", null);
  }

  GenericResponse _genericResponseFromJson(int statusCode, String message, dynamic data) {
    var genericResponse = new GenericResponse();
    genericResponse.statusCode = statusCode;
    genericResponse.message = message;
    genericResponse.data = data ;
    return genericResponse ;
  }

}

class GenericResponse {
  late int statusCode ;
  late String message ;
  dynamic data ;
}