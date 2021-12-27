import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_fa/seguir_apostando_sport_fa_card_widget_functions.dart';
import 'package:flutter/material.dart';

class FACuartoConMasPuntosDelDartido {

  static List<Widget> get(Event event, dynamic _createBetForm, String betType, String text) {
    List<Widget> widgets = [];
    widgets.add(SeguirApostandoSportFACardWidgetFunctions.cuartosConMasPuntos(_createBetForm, event.faCuartoConMasPuntosDto));
    return widgets;
  }

}