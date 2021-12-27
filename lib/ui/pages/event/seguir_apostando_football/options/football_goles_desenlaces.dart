import 'package:bobebet_app/models/event/football/option_total_goles_tres_desenlaces.dart';
import 'package:bobebet_app/models/event/football/total_goles_tres_desenlaces.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/seguir_apostando_sport_football_card_widget_functions.dart';
import 'package:flutter/material.dart';

class FootballGolesDesenlace {

  static List<Widget> get(TotalGolesTresDesenlaces totalGolesTresDesenlaces, dynamic _createBetForm, String betType, _onMsg) {
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
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle(totalGolesTresDesenlaces.option1),
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle(totalGolesTresDesenlaces.option2),
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle(totalGolesTresDesenlaces.option3)
            ],
          )
      ),
    );
    for (int i = 0; i < totalGolesTresDesenlaces.rows.length; i++) {
      OptionTotalGolesTresDesenlaces optionTotalGolesDesenlace = totalGolesTresDesenlaces.rows[i];
      widgets.add(
          SeguirApostandoSportFootballCardWidgetFunctions.desenlaceTresOpcionesContent(_createBetForm, optionTotalGolesDesenlace, betType, _onMsg)
      );
      widgets.add(
          SizedBox(height: 10, child:Container(color: Colors.white))
      ) ;
    }
    return widgets ;
  }

  /*
  static List<Widget> get(TotalGolesTresDesenlaces totalGolesTresDesenlaces, dynamic _createBetForm, String betType, String text) {
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
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle(totalGolesTresDesenlaces.option1),
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle(totalGolesTresDesenlaces.option2),
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle(totalGolesTresDesenlaces.option3),
            ],
          )
        ),
    ) ;

    for (int i = 0; i < totalGolesTresDesenlaces.rows.length; i++) {
      OptionTotalGolesTresDesenlaces optionTotalGolesDesenlace = totalGolesTresDesenlaces.rows[i];
      widgets.add( Container(color: Colors.white, child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              (optionTotalGolesDesenlace.showMenos)
                  ?
              GestureDetector(
                onTap: () => {
                  _createBetForm("Menos de_" + optionTotalGolesDesenlace.golesMenos.toString(), "Menos de " + optionTotalGolesDesenlace.golesMenos.toString() + " gol(es)", optionTotalGolesDesenlace.golesCoeffMenos,betType,text)
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: new LinearGradient( colors: [Colors.deepPurple, Colors.deepPurple], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                  ),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: <Widget>[
                      Text(optionTotalGolesDesenlace.golesMenos.toString() + (optionTotalGolesDesenlace.golesMenos==1 ? " gol" : " goles"), style: TextStyle(color: Colors.white, fontSize: 14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${double.parse((optionTotalGolesDesenlace.golesCoeffMenos).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),
              )
                  :
              Container(height: 50, width: 100),
              (optionTotalGolesDesenlace.showExactamente)
                  ?
              GestureDetector(
                onTap: () => {
                  _createBetForm("Exactamente_" + optionTotalGolesDesenlace.golesExactamente.toString(), "Exactamente " + optionTotalGolesDesenlace.golesExactamente.toString() + " gol(es)", optionTotalGolesDesenlace.golesCoeffExactamente,betType,text)
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius:      BorderRadius.circular(
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
                          optionTotalGolesDesenlace.golesExactamente.toString() + (optionTotalGolesDesenlace.golesExactamente==1 ? " gol" : " goles"),
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
                              "${double.parse((optionTotalGolesDesenlace.golesCoeffExactamente).toStringAsFixed(3))}",
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
                width: 100,
              ),
              (optionTotalGolesDesenlace.showMas)
                  ? GestureDetector(
                onTap: () => {
                  _createBetForm("Más de_" + optionTotalGolesDesenlace.golesMas.toString(), "Más de " + optionTotalGolesDesenlace.golesMas.toString() + " gol(es)", optionTotalGolesDesenlace.golesCoeffMas,betType,text)
                },
                child: Container(
                  height: 50,
                  width: 100,
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
                          optionTotalGolesDesenlace.golesMas.toString() + (optionTotalGolesDesenlace.golesMas==1 ? " gol" : " goles"),
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
                              "${double.parse((optionTotalGolesDesenlace.golesCoeffMas).toStringAsFixed(3))}",
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
                width: 100,
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
