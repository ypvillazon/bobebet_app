
import 'package:bobebet_app/models/event/tennis/option_cantidad_de_sets_dto.dart';

class CantidadDeSetsDto {

  late bool available ;
  late String title ;
  late List<OptionCantidadDeSetsDto> rows ;

  CantidadDeSetsDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      available = map['available'];
      title = map['title'];
      if (map['rows'] != null) {
        rows = (map['rows'] as List).map((optionCantidadDeSetsDto) => OptionCantidadDeSetsDto.fromMap(optionCantidadDeSetsDto)).toList() ;
      } else {
        rows = [];
      }
    }
  }

}

