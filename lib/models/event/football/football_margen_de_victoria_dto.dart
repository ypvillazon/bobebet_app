import 'package:bobebet_app/models/event/football/football_option_margen_de_victoria_dto.dart';

class FootBallMargenDeVictoriaDto {
  late bool available ;
  late  String title ;
  late List<FootBallOptionMargenDeVictoriaDto> footBallOptionMargenDeVictoriaDtos ;

  FootBallMargenDeVictoriaDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      available = map['available'];
      title = map['title'];
      if (map['footballOptionMargenDeVictoriaDtos']  != null) {
        footBallOptionMargenDeVictoriaDtos =
            (map['footballOptionMargenDeVictoriaDtos'] as List).map((
                footBallOptionMargenDeVictoriaDto) =>
                FootBallOptionMargenDeVictoriaDto.fromMap(
                    footBallOptionMargenDeVictoriaDto)).toList();
      } else {
        footBallOptionMargenDeVictoriaDtos = [];
      }
    }
  }
}