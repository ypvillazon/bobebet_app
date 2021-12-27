
class Actualizacion {

  String versionName;
  String downloadLink;
  String nowVersionName;
  String tiempoRestanteActualizar;
  String versionAppStatus;
  String message;

  Actualizacion.fromMap(Map<String, dynamic> map) :
    versionName = map['versionName'],
    downloadLink = map['downloadLink'],
    nowVersionName = map['nowVersionName'],
    tiempoRestanteActualizar = map['tiempoRestanteActualizar'],
    versionAppStatus = map['versionAppStatus'],
    message = map['message'];

}

class ActualizacionResponse {
  late int statusCode ;
  late String message ;
  late Actualizacion actualizacion ;
}



