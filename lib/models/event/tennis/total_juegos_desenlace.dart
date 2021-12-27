import 'package:bobebet_app/models/event/tennis/option_total_juegos_dto.dart';

class TotalJuegosDesenlace {

  bool available ;
  String title ;
  String option1 ;
  String option2 ;
  List<OptionTotalJuegosDto> rows ;

  TotalJuegosDesenlace.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    option1 = map['option1'],
    option2 = map['option2'],
    rows = (map['rows'] != null) ? (map['rows'] as List).map((markers) => OptionTotalJuegosDto.fromMap(markers)).toList() : [];





}

