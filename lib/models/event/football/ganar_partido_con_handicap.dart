import 'package:bobebet_app/models/event/football/ganar_partido_con_handicap_option.dart';

class GanarPartidoConHandicap {

  bool available ;
  String title ;
  String home ;
  String away ;
  List<GanarPartidoConHandicapOption> rows ;

  GanarPartidoConHandicap.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    home = map['home'],
    away = map['away'],
    rows = (map['rows'] != null) ? (map['rows'] as List).map((row) => GanarPartidoConHandicapOption.fromMap(row)).toList() : [];

}

