class GanaPrimerSetYGanaPartido {

  late bool available ;
  late String title ;
  late String home ;
  late String away ;
  late double hcoeff ;
  late double acoeff ;

  GanaPrimerSetYGanaPartido.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      title = map['title'];
      available = map['available'];
      home = map['home'];
      away = map['away'];
      hcoeff = map['hcoeff'];
      acoeff = map['acoeff'];
    }
  }


}
