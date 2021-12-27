import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/models/event/football/football_option_margen_de_victoria_dto.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/seguir_apostando_sport_football_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FootBallMargenDeVictoria {

  static List<Widget> get(Event event, dynamic _createBetForm, String betType, String text) {
    List<Widget> widgets = [];
    for (int i = 0; i < event.footballMargenDeVictoriaDto.footBallOptionMargenDeVictoriaDtos.length; i++) {
      FootBallOptionMargenDeVictoriaDto option = event.footballMargenDeVictoriaDto.footBallOptionMargenDeVictoriaDtos[i];
      widgets.add(
          SeguirApostandoSportFootballCardWidgetFunctions.margenDeVictoria(_createBetForm, option, event, betType, text)
      );
    }
    return widgets;
  }

}