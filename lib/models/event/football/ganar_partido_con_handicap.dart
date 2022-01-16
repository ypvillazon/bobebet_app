import 'package:bobebet_app/models/event/football/ganar_partido_con_handicap_option.dart';

class GanarPartidoConHandicap {

  late bool available ;
  late String title ;
  late String home ;
  late String away ;
  late List<GanarPartidoConHandicapOption> rows ;

  GanarPartidoConHandicap.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      title = map['title'];
      available = map['available'];
      home = map['home'];
      away = map['away'];
      if (map != null && map['rows'] != null) {
        rows = (map['rows'] as List).map((row) =>
            GanarPartidoConHandicapOption.fromMap(row)).toList();
      } else {
        rows = [];
      }
    }
  }

}

