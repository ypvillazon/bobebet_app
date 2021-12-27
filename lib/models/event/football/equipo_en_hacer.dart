
class EquipoEnHacer {

  bool available ;
  String title ;
  String home ;
  String away ;
  String none ;
  String recibirTarjetaAmarilla ;
  double recibirTarjetaAmarillaCoeffH ;
  double recibirTarjetaAmarillaCoeffA ;
  double recibirTarjetaAmarillaCoeffNone ;
  bool recibirTarjetaAmarillaAvailable;

  String tomarUnCornerOption ;
  double tomarUnCornerCoeffH ;
  double tomarUnCornerCoeffA ;
  double tomarUnCornerCoeffNone ;
  bool tomarUnCornerAvailable;

  String marcarUnGolOption ;
  double marcarUnGolCoeffH ;
  double marcarUnGolCoeffA ;
  double marcarUnGolCoeffNone ;
  bool marcarUnGolAvailable;

  EquipoEnHacer.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    home = map['home'],
    away = map['away'],
    none = map['none'],
    recibirTarjetaAmarilla = map['recibirTarjetaAmarilla'],
    recibirTarjetaAmarillaCoeffH = map['recibirTarjetaAmarillaCoeffH'],
    recibirTarjetaAmarillaCoeffA = map['recibirTarjetaAmarillaCoeffA'],
    recibirTarjetaAmarillaCoeffNone = map['recibirTarjetaAmarillaCoeffNone'],
    recibirTarjetaAmarillaAvailable = map['recibirTarjetaAmarillaAvailable'],

    tomarUnCornerOption = map['tomarUnCornerOption'],
    tomarUnCornerCoeffH = map['tomarUnCornerCoeffH'],
    tomarUnCornerCoeffA = map['tomarUnCornerCoeffA'],
    tomarUnCornerCoeffNone = map['tomarUnCornerCoeffNone'],
    tomarUnCornerAvailable = map['tomarUnCornerAvailable'],
   
    marcarUnGolOption = map['marcarUnGolOption'],
    marcarUnGolCoeffH = map['marcarUnGolCoeffH'],
    marcarUnGolCoeffA = map['marcarUnGolCoeffA'],
    marcarUnGolCoeffNone = map['marcarUnGolCoeffNone'],
    marcarUnGolAvailable = map['marcarUnGolAvailable'];

}

