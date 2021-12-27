import 'package:bobebet_app/models/event/football/ganar_partido_con_handicap.dart';
import 'package:bobebet_app/models/event/football/ganar_partido_con_handicap_asiatico.dart';
import 'package:bobebet_app/models/event/football/ganar_partido_con_handicap_asiatico_option.dart';
import 'package:bobebet_app/models/event/football/ganar_partido_con_handicap_option.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/seguir_apostando_sport_football_card_widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GanarPartidoConHandicapElement {

  static List<Widget> get(GanarPartidoConHandicap ganarPartidoConHandicap, dynamic _createBetForm, String betType, _onMsg) {
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
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle2Columns(ganarPartidoConHandicap.home),
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle2Columns(ganarPartidoConHandicap.away),
            ],
          )
      ),
    ) ;

    for (int i = 0; i < ganarPartidoConHandicap.rows.length; i++) {
      GanarPartidoConHandicapOption ganarPartidoConHandicapOption = ganarPartidoConHandicap.rows[i];
      String targetH = ganarPartidoConHandicapOption.homeHandicap.toString()+"_"+ganarPartidoConHandicapOption.homeHandicap.toString()+"="+ganarPartidoConHandicapOption.awayHandicap.toString()+"_H" ;
      String targetA = ganarPartidoConHandicapOption.awayHandicap.toString()+"_"+ganarPartidoConHandicapOption.homeHandicap.toString()+"="+ganarPartidoConHandicapOption.awayHandicap.toString()+"_A" ;
      widgets.add(
          handicap(_createBetForm, targetH, targetA, ganarPartidoConHandicapOption, ganarPartidoConHandicap.home, ganarPartidoConHandicap.away, betType, _onMsg)
      );
      widgets.add(
          SizedBox(height: 10, child:Container(color: Colors.white,))
      ) ;
    }
    return widgets ;
  }


  static List<Widget> get1(GanarPartidoConHandicapAsiatico ganarPartidoConHandicapAsiatico, dynamic _createBetForm, String betType, _onMsg) {
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
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle2Columns(ganarPartidoConHandicapAsiatico.home),
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle2Columns(ganarPartidoConHandicapAsiatico.away),
            ],
          )
      ),
    ) ;

    for (int i = 0; i < ganarPartidoConHandicapAsiatico.rows.length; i++) {
      GanarPartidoConHandicapAsiaticoOption ganarPartidoConHandicapAsiaticoOption = ganarPartidoConHandicapAsiatico.rows[i];
      String targetH = ganarPartidoConHandicapAsiaticoOption.homeHandicap.toString()+"_"+ganarPartidoConHandicapAsiaticoOption.homeHandicap.toString()+"="+ganarPartidoConHandicapAsiaticoOption.awayHandicap.toString()+"_H" ;
      String targetA = ganarPartidoConHandicapAsiaticoOption.awayHandicap.toString()+"_"+ganarPartidoConHandicapAsiaticoOption.homeHandicap.toString()+"="+ganarPartidoConHandicapAsiaticoOption.awayHandicap.toString()+"_A" ;
      widgets.add(
          handicapAsiatico(_createBetForm, targetH, targetA, ganarPartidoConHandicapAsiaticoOption, ganarPartidoConHandicapAsiatico.home, ganarPartidoConHandicapAsiatico.away, betType, _onMsg)
      );
      widgets.add(
          SizedBox(height: 10, child:Container(color: Colors.white,))
      ) ;
    }
    return widgets ;
  }

  static Widget handicap(_createBetForm, targetH, targetA, GanarPartidoConHandicapOption ganarPartidoConHandicapOption, String home, String away, String betType, _onMsg) {
    return  Container(color: Colors.white, child: Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        handicapContent(_createBetForm, targetH, ganarPartidoConHandicapOption.homeHandicap, ganarPartidoConHandicapOption.coeffHomeHandicap, ganarPartidoConHandicapOption.showH, home, betType, _onMsg),
        handicapContent(_createBetForm, targetA, ganarPartidoConHandicapOption.awayHandicap, ganarPartidoConHandicapOption.coeffAwayHandicap, ganarPartidoConHandicapOption.showA, away, betType, _onMsg)
      ],
    )
    );
  }


  static Widget handicapAsiatico(_createBetForm, targetH, targetA, GanarPartidoConHandicapAsiaticoOption ganarPartidoConHandicapAsiaticoOption, String home, String away, String betType, _onMsg) {
    return  Container(color: Colors.white, child: Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        handicapContent(_createBetForm, targetH, ganarPartidoConHandicapAsiaticoOption.homeHandicap, ganarPartidoConHandicapAsiaticoOption.coeffHomeHandicap, ganarPartidoConHandicapAsiaticoOption.showH, home, betType, _onMsg),
        handicapContent(_createBetForm, targetA, ganarPartidoConHandicapAsiaticoOption.awayHandicap, ganarPartidoConHandicapAsiaticoOption.coeffAwayHandicap, ganarPartidoConHandicapAsiaticoOption.showA, away, betType, _onMsg)
      ],
    )
    );
  }




  static Widget handicapContent(_createBetForm, String target, handicap, double coeff, bool show, String text, String betType, _onMsg) {
    return GestureDetector(
      onTap: () => {
        if (show) {
          _createBetForm(target, text + " (" + handicap.toString() + ")", coeff, betType, "")
        } else {
          _onMsg(text + " (" + handicap.toString() + ")")
        }
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
            Text("(" + handicap.toString() + ")", style: TextStyle(color: Colors.white, fontSize: 14)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (show) ?
                Text("${double.parse((coeff).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                    :
                Icon(Icons.remove, color: Colors.grey)
              ],
            )
          ],
        ),
      ),
    );
  }






  /*
  static List<Widget> get(GanarPartidoConHandicap ganarPartidoConHandicap, dynamic _createBetForm, String betType) {
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
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle2Columns(ganarPartidoConHandicap.home),
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle2Columns(ganarPartidoConHandicap.away),
            ],
          )
        ),
    ) ;

    for (int i = 0; i < ganarPartidoConHandicap.rows.length; i++) {
      GanarPartidoConHandicapOption ganarPartidoConHandicapOption = ganarPartidoConHandicap.rows[i];
      String targetH = ganarPartidoConHandicapOption.homeHandicap.toString()+"_"+ganarPartidoConHandicapOption.homeHandicap.toString()+"="+ganarPartidoConHandicapOption.awayHandicap.toString()+"_H" ;
      String targetA = ganarPartidoConHandicapOption.awayHandicap.toString()+"_"+ganarPartidoConHandicapOption.homeHandicap.toString()+"="+ganarPartidoConHandicapOption.awayHandicap.toString()+"_A" ;
      widgets.add( Container(color: Colors.white, child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              (ganarPartidoConHandicapOption.showH) ?
                GestureDetector(
                  onTap: () => {
                    _createBetForm(targetH, ganarPartidoConHandicap.home + " (" + ganarPartidoConHandicapOption.homeHandicap.toString() + ")", ganarPartidoConHandicapOption.coeffHomeHandicap, betType, "")
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
                        Text("("+ganarPartidoConHandicapOption.homeHandicap.toString()+")", style: TextStyle(color: Colors.white, fontSize: 14)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("${double.parse((ganarPartidoConHandicapOption.coeffHomeHandicap).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                  ),
                ):
                Container( height: 50, width: 140)
              ,

              (ganarPartidoConHandicapOption.showA) ?
                GestureDetector(
                  onTap: () => {
                    _createBetForm(targetA, ganarPartidoConHandicap.away + " (" + ganarPartidoConHandicapOption.awayHandicap.toString() + ")", ganarPartidoConHandicapOption.coeffAwayHandicap, betType, "")
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
                        Text("("+ganarPartidoConHandicapOption.awayHandicap.toString()+")", style: TextStyle(color: Colors.white, fontSize: 14)),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: <Widget>[
                            Text("${double.parse((ganarPartidoConHandicapOption.coeffAwayHandicap).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                  ),
                ):
              Container( height: 50, width: 140)
                ,
            ],
          )
      ));
      widgets.add(
          SizedBox(height: 10, child:Container(color: Colors.white,))
      ) ;
    }
    return widgets ;
  }





  static List<Widget> get1(GanarPartidoConHandicapAsiatico ganarPartidoConHandicap, dynamic _createBetForm, String betType) {
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
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle2Columns(ganarPartidoConHandicap.home),
              SeguirApostandoSportFootballCardWidgetFunctions.teamTitle2Columns(ganarPartidoConHandicap.away),
            ],
          )
      ),
    ) ;

    for (int i = 0; i < ganarPartidoConHandicap.rows.length; i++) {
      GanarPartidoConHandicapAsiaticoOption ganarPartidoConHandicapOption = ganarPartidoConHandicap.rows[i];
      String targetH = ganarPartidoConHandicapOption.homeHandicap.toString()+"_"+ganarPartidoConHandicapOption.homeHandicap.toString()+"="+ganarPartidoConHandicapOption.awayHandicap.toString()+"_H" ;
      String targetA = ganarPartidoConHandicapOption.awayHandicap.toString()+"_"+ganarPartidoConHandicapOption.homeHandicap.toString()+"="+ganarPartidoConHandicapOption.awayHandicap.toString()+"_A" ;
      widgets.add( Container(color: Colors.white, child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          (ganarPartidoConHandicapOption.showH) ?
            GestureDetector(
              onTap: () => {
                _createBetForm(targetH, ganarPartidoConHandicap.home + " (" + ganarPartidoConHandicapOption.homeHandicap.toString() + ")", ganarPartidoConHandicapOption.coeffHomeHandicap, betType, "")
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
                    Text("("+ganarPartidoConHandicapOption.homeHandicap.toString()+")", style: TextStyle(color: Colors.white, fontSize: 14)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${double.parse((ganarPartidoConHandicapOption.coeffHomeHandicap).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
            ) :
            Container( height: 50, width: 140)
          ,

          (ganarPartidoConHandicapOption.showA) ?
          GestureDetector(
            onTap: () => {
              _createBetForm(targetA, ganarPartidoConHandicap.away + " (" + ganarPartidoConHandicapOption.awayHandicap.toString() + ")", ganarPartidoConHandicapOption.coeffAwayHandicap, betType, "")
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
                  Text("("+ganarPartidoConHandicapOption.awayHandicap.toString()+")", style: TextStyle(color: Colors.white, fontSize: 14)),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                    children: <Widget>[
                      Text("${double.parse((ganarPartidoConHandicapOption.coeffAwayHandicap).toStringAsFixed(3))}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),
          ) :
          Container( height: 50, width: 140)
          ,
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
