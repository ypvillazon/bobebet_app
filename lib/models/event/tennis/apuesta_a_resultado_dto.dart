import 'package:bobebet_app/models/event/tennis/apuesta_a_resultado_option_dto.dart';

class ApuestaAResultadoDto {

  bool available ;
  String title ;
  List<ApuestaAResultadoOptionDto> resultados ;

  ApuestaAResultadoDto.fromMap(Map<String, dynamic> map) :
    title = map['title'],
    available = map['available'],
    resultados = (map['resultados'] != null) ? (map['resultados'] as List).map((resultado) => ApuestaAResultadoOptionDto.fromMap(resultado)).toList() : [];

}

