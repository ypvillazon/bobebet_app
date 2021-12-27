import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/seguir_apostando_sport_football_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FootballTiempoConMasGolesH {

  static List<Widget> get(Event event, dynamic _createBetForm, String betType, String text) {
    List<Widget> widgets = [] ;
    widgets.add(SeguirApostandoSportFootballCardWidgetFunctions.tiempoPorGolesElement(_createBetForm, event.tiempoConMasGolesH, betType, text)) ;
    return widgets ;
  }
}
