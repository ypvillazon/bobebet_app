import 'dart:ui';
import 'package:bobebet_app/models/bet.dart';
import 'package:bobebet_app/services/get_one_bet_service.dart';
import 'package:bobebet_app/ui/pages/bets/bets_widgets.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BetsCardWidget extends StatefulWidget {
  final Bets bets;

  BetsCardWidget({Key? key, required this.bets}) : super(key: key);

  @override
  _BetsCardWidgetSate createState() => new _BetsCardWidgetSate();
}

class _BetsCardWidgetSate extends State<BetsCardWidget> {

  GetOneBetService getOneBetService = new GetOneBetService() ;

  late Bets bets ;
  bool loading = false ;
  late double _height;
  late double _width;

  @override
  void initState() {
    bets = widget.bets ;
  }


  void _updateEvent() {
    setState(() {
      loading=true;
    });
    getOneBetService.get(bets.id).then((value) {
      if (value.statusCode == 0) {
        setState(() {
          bets = value.bet ;
          loading = false ;
        });
      } else {
        setState(() {
          loading = false ;
        });
        MessageWidget.error(context, value.message, 4);
      }
    });
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
                height: (loading ? 200 : null),
                padding: const EdgeInsets.all(10.0),
                child:
                loading
                    ?
                  HelperFunctions.updating(_width)
                 :
                Column(
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
                    Text((bets.description==null ? "" : bets.description),style: TextStyle(color: Colors.deepPurple.withOpacity(0.8), fontSize: 16), textAlign: TextAlign.center),
                    SizedBox(height: _height / 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                            EventBetsWidgets.betContent(_width, bets.target, bets.targetDescription, bets.coeff)
                      ],
                    ),
                    SizedBox(height: _height / 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Fecha del partido: ${bets.eventDate}", style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),)
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

