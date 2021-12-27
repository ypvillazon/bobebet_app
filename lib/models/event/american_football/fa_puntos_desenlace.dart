import 'package:bobebet_app/models/event/american_football/fa_option_puntos.dart';

class FAPuntosDesenlace {

  bool available ;
  String title ;
  String option1 ;
  String option2 ;
  List<FAOptionPuntos> rows ;

  FAPuntosDesenlace.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    option1 = map['option1'],
    option2 = map['option2'],
    rows = (map['rows'] != null) ? (map['rows'] as List).map((markers) => FAOptionPuntos.fromMap(markers)).toList() : [];

}

