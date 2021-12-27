import 'package:bobebet_app/models/event/football/football_option_margen_de_victoria_dto.dart';

class FootBallMargenDeVictoriaDto {
  bool available ;
  String title ;
  List<FootBallOptionMargenDeVictoriaDto> footBallOptionMargenDeVictoriaDtos ;

  FootBallMargenDeVictoriaDto.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    footBallOptionMargenDeVictoriaDtos = (map['footballOptionMargenDeVictoriaDtos'] != null) ? (map['footballOptionMargenDeVictoriaDtos'] as List).map((footBallOptionMargenDeVictoriaDto) => FootBallOptionMargenDeVictoriaDto.fromMap(footBallOptionMargenDeVictoriaDto)).toList() : [];

}