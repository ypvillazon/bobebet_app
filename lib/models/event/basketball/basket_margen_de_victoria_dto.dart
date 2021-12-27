import 'package:bobebet_app/models/event/basketball/basket_option_margen_de_victoria_dto.dart';

class BasketMargenDeVictoriaDto {
  bool available ;
  String title ;
  List<BasketOptionMargenDeVictoriaDto> basketOptionMargenDeVictoriaDtos ;

  BasketMargenDeVictoriaDto.fromMap(Map<String, dynamic> map) :
    available = map['available'],
    title = map['title'],
    basketOptionMargenDeVictoriaDtos = (map['basketOptionMargenDeVictoriaDtos'] != null) ? (map['basketOptionMargenDeVictoriaDtos'] as List).map((basketOptionMargenDeVictoriaDto) => BasketOptionMargenDeVictoriaDto.fromMap(basketOptionMargenDeVictoriaDto)).toList() : [];

}