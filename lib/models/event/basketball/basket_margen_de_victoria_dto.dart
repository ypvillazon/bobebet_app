import 'package:bobebet_app/models/event/basketball/basket_option_margen_de_victoria_dto.dart';

class BasketMargenDeVictoriaDto {
  late bool available ;
  late String title ;
  late List<BasketOptionMargenDeVictoriaDto> basketOptionMargenDeVictoriaDtos ;

  BasketMargenDeVictoriaDto.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      available = map['available'];
      title = map['title'];
      if (map['basketOptionMargenDeVictoriaDtos'] != null) {
        basketOptionMargenDeVictoriaDtos = (map['basketOptionMargenDeVictoriaDtos'] as List).map((basketOptionMargenDeVictoriaDto) => BasketOptionMargenDeVictoriaDto.fromMap(basketOptionMargenDeVictoriaDto)).toList();
      } else {
        basketOptionMargenDeVictoriaDtos = [];
      }
    }
  }


}