import 'package:bobebet_app/models/event/tennis/option_total_juegos_dto.dart';
import 'package:bobebet_app/models/event/tennis/total_de_sets_dto.dart';
import 'package:bobebet_app/models/event/tennis/total_juegos_desenlace.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/seguir_apostando_sport_baseball_card_widget_functions.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/seguir_apostando_sport_tennis_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TotalDeSets {

  static List<Widget> get(TotalJuegosDesenlace totalDeSetsDto, dynamic _createBetForm) {
    List<Widget> widgets = [] ;
    widgets.add(
        Container(
          padding: EdgeInsets.only(right: 10, top: 10, bottom: 0),
          decoration: BoxDecoration(
              color: Colors.white,
             // borderRadius: BorderRadius.all(Radius.circular(6))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SeguirApostandoSportBaseballCardWidgetFunctions.teamTitle1("Menos de"),
              SeguirApostandoSportBaseballCardWidgetFunctions.teamTitle1("Más de"),
            ],
          )
        ),
    );
    for (int i = 0; i < totalDeSetsDto.rows.length; i++) {
      OptionTotalJuegosDto optionTotalJuegosDto = totalDeSetsDto.rows[i];
      widgets.add(SeguirApostandoSportTennisCardWidgetFunctions.totalSets(_createBetForm, optionTotalJuegosDto));
    }
    return widgets ;
  }
}
