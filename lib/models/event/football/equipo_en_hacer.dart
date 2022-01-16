
class EquipoEnHacer {

  late bool available ;
  late   String title ;
  late  String home ;
  late   String away ;
  late  String none ;
  late  String recibirTarjetaAmarilla ;
  late  double recibirTarjetaAmarillaCoeffH ;
  late  double recibirTarjetaAmarillaCoeffA ;
  late   double recibirTarjetaAmarillaCoeffNone ;
  late  bool recibirTarjetaAmarillaAvailable;
  late  String tomarUnCornerOption ;
  late   double tomarUnCornerCoeffH ;
  late   double tomarUnCornerCoeffA ;
  late   double tomarUnCornerCoeffNone ;
  late  bool tomarUnCornerAvailable;
  late   String marcarUnGolOption ;
  late   double marcarUnGolCoeffH ;
  late   double marcarUnGolCoeffA ;
  late   double marcarUnGolCoeffNone ;
  late bool marcarUnGolAvailable;

  EquipoEnHacer.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      available = map['available'];
      title = map['title'];
      home = map['home'];
      away = map['away'];
      none = map['none'];
      recibirTarjetaAmarilla = map['recibirTarjetaAmarilla'];
      recibirTarjetaAmarillaCoeffH = map['recibirTarjetaAmarillaCoeffH'];
      recibirTarjetaAmarillaCoeffA = map['recibirTarjetaAmarillaCoeffA'];
      recibirTarjetaAmarillaCoeffNone = map['recibirTarjetaAmarillaCoeffNone'];
      recibirTarjetaAmarillaAvailable = map['recibirTarjetaAmarillaAvailable'];
      tomarUnCornerOption = map['tomarUnCornerOption'];
      tomarUnCornerCoeffH = map['tomarUnCornerCoeffH'];
      tomarUnCornerCoeffA = map['tomarUnCornerCoeffA'];
      tomarUnCornerCoeffNone = map['tomarUnCornerCoeffNone'];
      tomarUnCornerAvailable = map['tomarUnCornerAvailable'];
      marcarUnGolOption = map['marcarUnGolOption'];
      marcarUnGolCoeffH = map['marcarUnGolCoeffH'];
      marcarUnGolCoeffA = map['marcarUnGolCoeffA'];
      marcarUnGolCoeffNone = map['marcarUnGolCoeffNone'];
      marcarUnGolAvailable = map['marcarUnGolAvailable'];
    }
  }

}

