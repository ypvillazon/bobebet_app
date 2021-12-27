import 'package:bobebet_app/models/event/boxing/option_total_puntos.dart';

class OptionsTotalCompletedRoundsDosDesenlacesDto {

  bool available ;
  String title ;
  String option1 ;
  String option2 ;
  List<OptionTotalCompletedRoundsDosDesenlacesDto> rows ;

  OptionsTotalCompletedRoundsDosDesenlacesDto.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    option1 = map['option1'],
    option2 = map['option2'],
    rows = (map['rows'] != null) ? (map['rows'] as List).map((markers) => OptionTotalCompletedRoundsDosDesenlacesDto.fromMap(markers)).toList() : [];

}

