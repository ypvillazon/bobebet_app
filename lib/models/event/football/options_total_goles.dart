
import 'package:bobebet_app/models/event/football/option_total_goles.dart';

class OptionsTotalGoles {

  bool available ;
  String title ;
  String option1 ;
  String option2 ;
  List<OptionTotalGoles> rows ;

  OptionsTotalGoles.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    option1 = map['option1'],
    option2 = map['option2'],
    rows = (map['rows'] != null) ? (map['rows'] as List).map((optionTotalGoles) => OptionTotalGoles.fromMap(optionTotalGoles)).toList() : [];

}

