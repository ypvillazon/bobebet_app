import 'package:bobebet_app/models/event/tennis/apuesta_a_resultado_option_dto.dart';

class ApuestaAResultadoDto {

  late bool available ;
  late  String title ;
  late List<ApuestaAResultadoOptionDto> resultados ;

  ApuestaAResultadoDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      title = map['title'];
      available = map['available'];
      if (map['resultados'] != null) {
        resultados = (map['resultados'] as List).map((resultado) => ApuestaAResultadoOptionDto.fromMap(resultado)).toList();
      } else {
        resultados = [];
      }
    }
  }

}

