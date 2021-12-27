import 'package:bobebet_app/models/event/basketball/basket_option_margen_de_victoria_dto.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_basketball/seguir_apostando_sport_basketball_card_widget_functions.dart';
import 'package:flutter/material.dart';

class BasketMargenDeVictoria {

  static List<Widget> get(Event event, dynamic _createBetForm, String betType, String text) {
    List<Widget> widgets = [];
    for (int i = 0; i < event.basketMargenDeVictoriaDto.basketOptionMargenDeVictoriaDtos.length; i++) {
      BasketOptionMargenDeVictoriaDto option = event.basketMargenDeVictoriaDto.basketOptionMargenDeVictoriaDtos[i];
      widgets.add(
          SeguirApostandoSportBasketballCardWidgetFunctions.margenDeVictoria(_createBetForm, option, event, betType, text)
      );
    }
    return widgets;
  }

}