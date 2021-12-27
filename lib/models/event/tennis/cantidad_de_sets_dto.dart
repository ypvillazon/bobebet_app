
import 'package:bobebet_app/models/event/tennis/option_cantidad_de_sets_dto.dart';

class CantidadDeSetsDto {

  bool available ;
  String title ;
  List<OptionCantidadDeSetsDto> rows ;

  CantidadDeSetsDto.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    rows = (map['rows'] != null) ? (map['rows'] as List).map((optionCantidadDeSetsDto) => OptionCantidadDeSetsDto.fromMap(optionCantidadDeSetsDto)).toList() : [];

}

