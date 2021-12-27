import 'package:bobebet_app/models/event/tennis/cantidad_de_sets_dto.dart';
import 'package:bobebet_app/models/event/tennis/option_cantidad_de_sets_dto.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/seguir_apostando_sport_tennis_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CantidadDeSets {

  static List<Widget> get(CantidadDeSetsDto cantidadDeSetsDto, dynamic _createBetForm) {
    List<Widget> widgets = [];
    for (int i = 0; i < cantidadDeSetsDto.rows.length; i++) {
      OptionCantidadDeSetsDto option = cantidadDeSetsDto.rows[i];
      widgets.add(
          SeguirApostandoSportTennisCardWidgetFunctions.optionnCantidadSets(_createBetForm,option)
      );
    }
    return widgets;
  }
}
