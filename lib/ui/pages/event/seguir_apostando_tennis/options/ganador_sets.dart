import 'package:bobebet_app/models/event/tennis/ganador_set_dto.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/seguir_apostando_sport_tennis_card_widget_functions.dart';
import 'package:flutter/material.dart';

class GanadorPorSets {

  static List<Widget> get(GanadorSetDto ganadorSetDto, dynamic _createBetForm, String betType) {
    List<Widget> widgets = [];
    widgets.add(SeguirApostandoSportTennisCardWidgetFunctions.ganadorSets(_createBetForm, ganadorSetDto, betType));
    return widgets;
  }

}