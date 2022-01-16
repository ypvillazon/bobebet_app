import 'package:bobebet_app/models/event/football/ganar_partido_con_handicap_asiatico_option.dart';

class GanarPartidoConHandicapAsiatico {

  late bool available ;
  late String title ;
  late String home ;
  late String away ;
  late List<GanarPartidoConHandicapAsiaticoOption> rows ;

  GanarPartidoConHandicapAsiatico.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      title = map['title'];
      available = map['available'];
      home = map['home'];
      away = map['away'];
      if (map != null && map['rows'] != null) {
        rows = (map['rows'] as List).map((row) =>
            GanarPartidoConHandicapAsiaticoOption.fromMap(row)).toList();
      } else {
        rows = [];
      }
    }
  }

}

