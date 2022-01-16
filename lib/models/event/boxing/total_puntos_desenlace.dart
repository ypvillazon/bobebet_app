import 'package:bobebet_app/models/event/boxing/option_total_puntos.dart';

class OptionsTotalCompletedRoundsDosDesenlacesDto {

  late bool available ;
  late String title ;
  late  String option1 ;
  late  String option2 ;
  late List<OptionTotalCompletedRoundsDosDesenlacesDto> rows ;

  OptionsTotalCompletedRoundsDosDesenlacesDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      title = map['title'];
      available = map['available'];
      option1 = map['option1'];
      option2 = map['option2'];
      if (map['rows'] != null) {
        rows = (map['rows'] as List)
            .map((markers) =>
            OptionTotalCompletedRoundsDosDesenlacesDto.fromMap(markers))
            .toList();
      }
    }
  }

}

