import 'package:bobebet_app/models/event/baseball/option_total_carreras_desenlace.dart';
import 'package:bobebet_app/models/event/baseball/total_carreras_desenlace.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/seguir_apostando_sport_baseball_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarrerasDesenlace {

  static List<Widget> get(TotalCarrerasDesenlace totalCarrerasDesenlace, dynamic _createBetForm, String betType, _onMsg) {
    List<Widget> widgets = [] ;
    widgets.add(
      Container(
          padding: EdgeInsets.only(right: 10, top: 10, bottom: 0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SeguirApostandoSportBaseballCardWidgetFunctions.teamTitle1(totalCarrerasDesenlace.option1),
              SeguirApostandoSportBaseballCardWidgetFunctions.teamTitle1(totalCarrerasDesenlace.option2),
            ],
          )
      ),
    ) ;

    for (int i = 0; i < totalCarrerasDesenlace.rows.length; i++) {
      OptionTotalCarrerasDesenlace optionTotalCarrerasDesenlace = totalCarrerasDesenlace.rows[i];
      widgets.add(
          SeguirApostandoSportBaseballCardWidgetFunctions.desenlaceDosOpcionesContent(_createBetForm, optionTotalCarrerasDesenlace, betType, _onMsg)
      );
      widgets.add(
          SizedBox(height: 10, child:Container(color: Colors.white,))
      ) ;
    }
    return widgets ;
  }

  /*
  static List<Widget> get(TotalCarrerasDesenlace totalCarrerasDesenlace, dynamic _createBetForm, String betType, String text) {
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
              SeguirApostandoSportBaseballCardWidgetFunctions.teamTitle1(totalCarrerasDesenlace.option1),
              SeguirApostandoSportBaseballCardWidgetFunctions.teamTitle1(totalCarrerasDesenlace.option2),
            ],
          )
        ),
    ) ;

    for (int i = 0; i < totalCarrerasDesenlace.rows.length; i++) {
      OptionTotalCarrerasDesenlace optionTotalCarrerasDesenlace = totalCarrerasDesenlace.rows[i];
      widgets.add( Container(color: Colors.white, child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              (optionTotalCarrerasDesenlace.showMenos)
                  ?
              GestureDetector(
                onTap: () => {
                  _createBetForm("Menos de_" + optionTotalCarrerasDesenlace.carrerasMenos.toString(), "Menos de " + optionTotalCarrerasDesenlace.carrerasMenos.toString() + " carrera(s)", optionTotalCarrerasDesenlace.coeffMenos,betType,text)
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
                      Text(optionTotalCarrerasDesenlace.carrerasMenos.toString() + (optionTotalCarrerasDesenlace.carrerasMenos==1 ? " carrera" : " carreras"), style: TextStyle(color: Colors.white, fontSize: 14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${double.parse((optionTotalCarrerasDesenlace.coeffMenos).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),
              )
                  :
              Container(height: 50, width: 140),

              (optionTotalCarrerasDesenlace.showMas)
                  ? GestureDetector(
                onTap: () => {
                  _createBetForm("Más de_" + optionTotalCarrerasDesenlace.carrerasMas.toString(), "Más de " + optionTotalCarrerasDesenlace.carrerasMas.toString() + " carrera(s)", optionTotalCarrerasDesenlace.coeffMas,betType,text)
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
                          optionTotalCarrerasDesenlace.carrerasMas.toString() + (optionTotalCarrerasDesenlace.carrerasMas==1 ? "  carrera" : " carreras"),
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
                              "${double.parse((optionTotalCarrerasDesenlace.coeffMas).toStringAsFixed(3))}",
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
