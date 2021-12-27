import 'package:bobebet_app/models/event/football/football_goles_dto.dart';
import 'package:bobebet_app/models/event/football/football_option_goles_dto.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/seguir_apostando_sport_football_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Goles {

  static List<Widget> get(FootballGolesDto footballGolesDto, dynamic _createBetForm, String betType, String text, _onMsg) {
    List<Widget> widgets = [];
    for (int i = 0; i < footballGolesDto.footballOptionGolesDtos.length; i++) {
      OptionGolesDto option = footballGolesDto.footballOptionGolesDtos[i];
      widgets.add(
          SeguirApostandoSportFootballCardWidgetFunctions.golesOption(_createBetForm, option, betType, text, _onMsg)
      );
    }
    return widgets;
  }

}