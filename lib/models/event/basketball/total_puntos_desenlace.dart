import 'package:bobebet_app/models/event/basketball/option_total_puntos.dart';

class TotalPuntosDesenlace {

  late bool available ;
  late String title ;
  late String option1 ;
  late  String option2 ;
  late  List<OptionTotalPuntos> rows ;

  TotalPuntosDesenlace.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      title = map['title'];
      available = map['available'];
      option1 = map['option1'];
      option2 = map['option2'];
      if (map['rows'] != null) {
        rows = (map['rows'] as List).map((markers) => OptionTotalPuntos.fromMap(markers)).toList();
      } else {
        rows = [];
      }
    }
  }
}

