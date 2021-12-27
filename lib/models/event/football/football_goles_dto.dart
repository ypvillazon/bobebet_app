import 'package:bobebet_app/models/event/football/football_option_goles_dto.dart';

class FootballGolesDto {

  bool available ;
  String title ;
  List<OptionGolesDto> footballOptionGolesDtos ;

  FootballGolesDto.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    footballOptionGolesDtos = (map['footballOptionGolesDtos'] != null) ? (map['footballOptionGolesDtos'] as List).map((optionGolesDto) => OptionGolesDto.fromMap(optionGolesDto)).toList() : [];

}

