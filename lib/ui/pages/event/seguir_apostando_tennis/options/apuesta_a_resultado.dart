import 'package:bobebet_app/models/event/tennis/apuesta_a_resultado_dto.dart';
import 'package:bobebet_app/models/event/tennis/apuesta_a_resultado_option_dto.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/seguir_apostando_sport_tennis_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApuestaAResultado {

  static List<Widget> get(ApuestaAResultadoDto apuestaAResultadoDto, dynamic _createBetForm) {
    List<Widget> widgets = [];
    for (int i = 0; i < apuestaAResultadoDto.resultados.length; i++) {
      ApuestaAResultadoOptionDto option = apuestaAResultadoDto.resultados[i];
      widgets.add(
          SeguirApostandoSportTennisCardWidgetFunctions.resultadosSets(_createBetForm,option)
      );
    }
    return widgets;
  }

}