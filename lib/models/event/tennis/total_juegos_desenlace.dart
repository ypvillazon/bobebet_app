import 'package:bobebet_app/models/event/tennis/option_total_juegos_dto.dart';

class TotalJuegosDesenlace {

  late bool available ;
  late String title ;
  late  String option1 ;
  late  String option2 ;
  late List<OptionTotalJuegosDto> rows ;

  TotalJuegosDesenlace.fromMap(Map<String, dynamic> map) {

    if (map != null) {
      title = map['title'];
      available = map['available'];
      option1 = map['option1'];
      option2 = map['option2'];

      if (map['rows'] != null) {
        rows = (map['rows'] as List).map((markers) => OptionTotalJuegosDto.fromMap(markers)).toList();
      } else {
        rows = [];
      }
    }
  }

}

