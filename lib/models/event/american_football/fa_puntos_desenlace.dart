import 'package:bobebet_app/models/event/american_football/fa_option_puntos.dart';

class FAPuntosDesenlace {

  late bool available ;
  late String title ;
  late String option1 ;
  late String option2 ;
  late List<FAOptionPuntos> rows ;

  FAPuntosDesenlace.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      title = map['title'];
      available = map['available'];
      option1 = map['option1'];
      option2 = map['option2'];
      if (map['rows'] != null) {
        rows = (map['rows'] as List).map((markers) => FAOptionPuntos.fromMap(markers)).toList();
      } else {
        rows = [];
      }
    }
  }

}

