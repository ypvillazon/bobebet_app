import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_basketball/seguir_apostando_sport_basketball_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultadosEncuentro {

  static List<Widget> get(Event event, dynamic _createBetForm) {
    List<Widget> widgets = [];
    if(event.resultadoPartidoDto.available) {
      widgets.add(
          SeguirApostandoSportBasketballCardWidgetFunctions
              .resultadoEncuentro(
              _createBetForm, event.resultadoPartidoDto,
              "BK_FINAL")
      );
    }
    return widgets;
  }

}