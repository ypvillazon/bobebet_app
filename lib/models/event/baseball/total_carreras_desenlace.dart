import 'package:bobebet_app/models/event/baseball/option_total_carreras_desenlace.dart';

class TotalCarrerasDesenlace {

  bool available ;
  String title ;
  String option1 ;
  String option2 ;

  List<OptionTotalCarrerasDesenlace> rows ;

  TotalCarrerasDesenlace.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    option1 = map['option1'],
    option2 = map['option2'],
    rows = (map['rows'] != null) ? (map['rows'] as List).map((markers) => OptionTotalCarrerasDesenlace.fromMap(markers)).toList() : [];

}

