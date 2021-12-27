import 'package:bobebet_app/models/event/football/option_total_goles_tres_desenlaces.dart';

class TotalGolesTresDesenlaces {

  bool available ;
  String title ;
  String option1 ;
  String option2 ;
  String option3 ;
  List<OptionTotalGolesTresDesenlaces> rows ;

  TotalGolesTresDesenlaces.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    option1 = map['option1'],
    option2 = map['option2'],
    option3 = map['option3'],
    rows = (map['rows'] != null) ? (map['rows'] as List).map((optionTotalGolesTresDesenlaces) => OptionTotalGolesTresDesenlaces.fromMap(optionTotalGolesTresDesenlaces)).toList() : [];


}

