
import 'package:bobebet_app/models/event/boxing/option_total_puntos.dart';
import 'package:bobebet_app/models/event/boxing/total_puntos_desenlace.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/seguir_apostando_sport_baseball_card_widget_functions.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_basketball/seguir_apostando_sport_basketball_card_widget_functions.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_boxing/seguir_apostando_sport_boxing_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundsDesenlace {

  static List<Widget> get(OptionsTotalCompletedRoundsDosDesenlacesDto totalPuntosDesenlace, dynamic _createBetForm, String betType, _onMsg) {
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
              SeguirApostandoSportBaseballCardWidgetFunctions.teamTitle1(totalPuntosDesenlace.option1),
              SeguirApostandoSportBaseballCardWidgetFunctions.teamTitle1(totalPuntosDesenlace.option2)
            ],
          )
      ),
    ) ;

    for (int i = 0; i < totalPuntosDesenlace.rows.length; i++) {
      OptionTotalCompletedRoundsDosDesenlacesDto optionTotalPuntos = totalPuntosDesenlace.rows[i];
      widgets.add(
          SeguirApostandoSportBoxingCardWidgetFunctions.desenlaceDosOpcionesContent(_createBetForm, optionTotalPuntos, betType, _onMsg)
      );
      widgets.add(
          SizedBox(height: 10, child:Container(color: Colors.white,))
      ) ;
    }
    return widgets ;
  }












  /*
  static List<Widget> get(TotalPuntosDesenlace totalPuntosDesenlace, dynamic _createBetForm, String betType) {
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
              SeguirApostandoSportBaseballCardWidgetFunctions.teamTitle1(totalPuntosDesenlace.option1),
              SeguirApostandoSportBaseballCardWidgetFunctions.teamTitle1(totalPuntosDesenlace.option2),
            ],
          )
        ),
    ) ;

    for (int i = 0; i < totalPuntosDesenlace.rows.length; i++) {
      OptionTotalPuntos optionTotalPuntos = totalPuntosDesenlace.rows[i];
      widgets.add( Container(color: Colors.white, child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              (optionTotalPuntos.showMenos)
                  ?
              GestureDetector(
                onTap: () => {
                  _createBetForm("Menos de_" + optionTotalPuntos.puntosMenos.toString(), "Menos de " + optionTotalPuntos.puntosMenos.toString() + " punto(s)", optionTotalPuntos.coeffMenos,betType,"")
                },
                child: Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: new LinearGradient( colors: [Colors.deepPurple, Colors.deepPurple], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                  ),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: <Widget>[
                      Text(optionTotalPuntos.puntosMenos.toString() + (optionTotalPuntos.puntosMenos==1 ? " punto" : " puntos"), style: TextStyle(color: Colors.white, fontSize: 14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${double.parse((optionTotalPuntos.coeffMenos).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),
              )
                  :
              Container(height: 50, width: 140),

              (optionTotalPuntos.showMas)
                  ? GestureDetector(
                onTap: () => {
                  _createBetForm("Más de_" + optionTotalPuntos.puntosMas.toString(), "Más de " + optionTotalPuntos.puntosMas.toString() + " punto(s)", optionTotalPuntos.coeffMas,betType,"")
                },
                child: Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(
                          10),
                      gradient:
                      new LinearGradient(
                          colors: [
                            Colors.deepPurple,
                            Colors.deepPurple
                          ],
                          begin: Alignment
                              .topCenter,
                          end: Alignment
                              .bottomCenter)),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          optionTotalPuntos.puntosMas.toString() + (optionTotalPuntos.puntosMas==1 ? "  punto" : " puntos"),
                          style: TextStyle(
                              color: Colors
                                  .white,
                              fontSize: 14)),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                        children: <Widget>[
                          Text(
                              "${double.parse((optionTotalPuntos.coeffMas).toStringAsFixed(3))}",
                              style: TextStyle(
                                  color: Colors
                                      .white,
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .bold))
                        ],
                      )
                    ],
                  ),
                ),
              )
                  : Container(
                height: 50,
                width: 140,
              )
            ],
          )
      ));
      widgets.add(
          SizedBox(height: 10, child:Container(color: Colors.white,))
      ) ;
    }
    return widgets ;
  }
   */
}
