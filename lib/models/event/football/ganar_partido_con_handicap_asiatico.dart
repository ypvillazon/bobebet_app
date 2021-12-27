import 'package:bobebet_app/models/event/football/ganar_partido_con_handicap_asiatico_option.dart';

class GanarPartidoConHandicapAsiatico {

  bool available ;
  String title ;
  String home ;
  String away ;
  List<GanarPartidoConHandicapAsiaticoOption> rows ;

  GanarPartidoConHandicapAsiatico.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    home = map['home'],
    away = map['away'],
    rows = (map['rows'] != null) ? (map['rows'] as List).map((row) => GanarPartidoConHandicapAsiaticoOption.fromMap(row)).toList() : [];

}

