import 'package:bobebet_app/models/event/football/football_option_goles_dto.dart';

class FootballGolesDto {

  late bool available ;
  late String title ;
  late List<OptionGolesDto> footballOptionGolesDtos ;

  FootballGolesDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      title = map['title'];
      available = map['available'];
      if (map['footballOptionGolesDtos'] != null) {
        footballOptionGolesDtos =
            (map['footballOptionGolesDtos'] as List).map((optionGolesDto) =>
                OptionGolesDto.fromMap(optionGolesDto)).toList();
      } else {
        footballOptionGolesDtos = [];
      }
    }
  }

}

