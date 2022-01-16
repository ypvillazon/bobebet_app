
import 'package:bobebet_app/models/event/football/option_total_goles.dart';

class OptionsTotalGoles {

  late bool available ;
  late String title ;
  late  String option1 ;
  late String option2 ;
  late List<OptionTotalGoles> rows ;

  OptionsTotalGoles.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      title = map['title'];
      available = map['available'];
      option1 = map['option1'];
      option2 = map['option2'];
      if (map != null && map['rows'] != null) {
        rows = (map['rows'] as List).map((optionTotalGoles) =>
            OptionTotalGoles.fromMap(optionTotalGoles)).toList();
      } else {
        rows = [];
      }
    }
  }

}

