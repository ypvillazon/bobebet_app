class GanaPrimerSetYGanaPartido {

  bool available ;
  String title ;
  String home ;
  String away ;
  double hcoeff ;
  double acoeff ;

  GanaPrimerSetYGanaPartido.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    home = map['home'],
    away = map['away'],
    hcoeff = map['hcoeff'],
    acoeff = map['acoeff'];

}
