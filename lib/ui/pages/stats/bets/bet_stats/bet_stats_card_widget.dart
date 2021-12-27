import 'dart:ui';
import 'package:bobebet_app/models/bet_stats.dart';
import 'package:bobebet_app/ui/pages/stats/bets/bet_stats/bet_stats_functions.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BetStatsCardWidget extends StatefulWidget {
  final BetStats betStats;

  BetStatsCardWidget({Key? key, required this.betStats}) : super(key: key);

  @override
  _BetStatsCardWidgetState createState() => new _BetStatsCardWidgetState();
}

class _BetStatsCardWidgetState extends State<BetStatsCardWidget> {

  late BetStats bets ;
  late double _height;
  late double _width;

  @override
  void initState() {
    bets = widget.betStats ;
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;

    _width = MediaQuery
        .of(context)
        .size
        .width;

    return Card(
        key: UniqueKey(),
        color: Colors.white,
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: _width*0.1),
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.topLeft,
                    width: _width/1.5,
                    height: 50,
                    //color: Colors.green,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50))
                    ),
                    child: HelperFunctions.betStatus(bets.status),
                  )
                ],
              )
              ,
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("apuesta: ", style: TextStyle(color: Colors.deepPurple, fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                          Text("\$${double.parse((bets.amount).toStringAsFixed(2))} ", style: TextStyle(color: Colors.blue, fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("ganancia prevista:  ", style: TextStyle(color: Colors.deepPurple, fontSize: 14, fontStyle: FontStyle.italic, fontWeight: (bets.betType.contains("HANDICAP")) ? FontWeight.normal : FontWeight.bold)),
                          (!bets.betType.contains("HANDICAP")) ?
                               Text("\$${double.parse((bets.amount*bets.coeff).toStringAsFixed(2))} ", style: TextStyle(color: Colors.green, fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold))
                          :
                               Text("            ", style: TextStyle(color: Colors.green, fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                    ]),

                    (bets.betType.contains("HANDICAP"))
                     ?
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text("completa: ", style: TextStyle(color: Colors.deepPurple, fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                              Text("\$${double.parse((bets.amount*bets.coeff).toStringAsFixed(2))} ", style: TextStyle(color: Colors.green, fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                        ])
                     :
                        Container()
                    ,
                  (bets.betType.endsWith("GANAR_PARTIDO_HANDICAP_ASIATICO"))
                        ?
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("ganado mitad: ", style: TextStyle(color: Colors.deepPurple, fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                          Text("\$${double.parse((((bets.amount/2)*bets.coeff)+(bets.amount/2)).toStringAsFixed(2))} ", style: TextStyle(color: Colors.green, fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                        ])
                        :
                    Container()
                    ,
                    (bets.betType.endsWith("GANAR_PARTIDO_HANDICAP_ASIATICO"))
                        ?
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("perdido mitad: ", style: TextStyle(color: Colors.deepPurple, fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                          Text("\$${double.parse(((bets.amount/2)).toStringAsFixed(2))} ", style: TextStyle(color: Colors.green, fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                        ])
                        :
                    Container()
                    ,
                    (bets.betType.endsWith("GANAR_PARTIDO_HANDICAP"))
                        ?
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("empate: ", style: TextStyle(color: Colors.deepPurple, fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                          Text("\$${double.parse((bets.amount).toStringAsFixed(2))} ", style: TextStyle(color: Colors.green, fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                        ])
                        :
                    Container()
                    ,


                    ListTile(
                      leading: _sportImage(bets.sportType),
                      title: Text("${bets.game}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                      subtitle: Text("${bets.event}", style: TextStyle(fontSize: 12),),
                    ),
                    Text((bets.description==null ? "" : bets.description),style: TextStyle(color: Colors.deepPurple.withOpacity(0.8), fontSize: 16)),
                    SizedBox(height: _height / 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BetStatsFunctions.content(_width, bets.target, bets.targetDescription, bets.coeff)
                      ],
                    ),
                    SizedBox(height: _height / 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Creada:  ", style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
                        Text("${bets.createdAt}", style: TextStyle(fontSize: 12, color: Colors.grey))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Fecha del partido:  ", style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
                        Text("${bets.eventDate}", style: TextStyle(fontSize: 12, color: Colors.grey))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Cuenta:  ", style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
                        Text("${bets.email}", style: TextStyle(fontSize: 12, color: Colors.grey))
                      ],
                    )
                  ],
                ),
              ),
            ])


    );
  }

  Widget _sportImage(String s) {
    String sport = "football.png" ;
    if(s == "BK") {
      sport = "basketball.png" ;
    }
    if(s == "BS") {
      sport = "baseball.png" ;
    }
    if(s == "TN") {
      sport = "tennis.png" ;
    }
    if(s == "BX") {
      sport = "boxing.png" ;
    }
    if(s == "FA") {
      sport = "fa.png" ;
    }
    return new Image.asset(
      'assets/images/' + sport,
      width: 40,
      height: 40,
    ) ;
  }


}

