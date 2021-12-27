import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_basketball/seguir_apostando_sport_basketball_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasketProrrogaDelPartido {

  static List<Widget> get(Event event, dynamic _createBetForm, String betType, String text) {
    List<Widget> widgets = [];
    widgets.add(SeguirApostandoSportBasketballCardWidgetFunctions.prorrogaDePartido(_createBetForm, event.prorrogaDePartidoDto));
    return widgets;
  }

}