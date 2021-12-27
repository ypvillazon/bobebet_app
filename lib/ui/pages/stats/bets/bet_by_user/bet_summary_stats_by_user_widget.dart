import 'dart:ui';
import 'package:bobebet_app/models/bet_summary_stats_by_user.dart';
import 'package:bobebet_app/ui/pages/stats/bets/bet_by_user/bet_summary_stats_by_user_functions.dart';
import 'package:bobebet_app/ui/pages/stats/bets/summary_stats/event_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BetSummaryStatsByUserWidget extends StatefulWidget {
  final BetSummaryStatsByUser betSummaryStatsByUser;

  BetSummaryStatsByUserWidget({Key? key, required this.betSummaryStatsByUser}) : super(key: key);

  @override
  _BetSummaryStatsByUserWidget createState() => new _BetSummaryStatsByUserWidget();
}

class _BetSummaryStatsByUserWidget extends State<BetSummaryStatsByUserWidget> {

  late BetSummaryStatsByUser betSummaryStatsByUser ;
  bool loading = false ;
  bool error = false;
  bool isFavorite = false ;
  late double _height;
  late double _width;

  @override
  void initState() {
    betSummaryStatsByUser = widget.betSummaryStatsByUser ;
  }

  @override
  void dispose() {
    super.dispose();
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
              new Container(
                height: (loading ? 260 : null),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BetSummaryStatsByUserFunctions.bar(_width, betSummaryStatsByUser),
                    SizedBox(height: _height / 70),
                    Text("Balance de cantidades", style: TextStyle(color: Colors.black54),),
                    Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        BetSummaryStatsWidgets.content("${betSummaryStatsByUser.total}", "Total"),
                        BetSummaryStatsWidgets.content("${betSummaryStatsByUser.wail}", "Espera"),
                        BetSummaryStatsWidgets.content("${betSummaryStatsByUser.won}", "Ganado"),
                        BetSummaryStatsWidgets.content("${betSummaryStatsByUser.lost}", "Perdido"),
                      ],
                    ),
                    Text(""),
                    Text("Balance de dinero", style: TextStyle(color: Colors.black54),),
                    Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        BetSummaryStatsWidgets.content("\$${betSummaryStatsByUser.stotal}", "Total"),
                        BetSummaryStatsWidgets.content("\$${betSummaryStatsByUser.swail}", "Espera"),
                        BetSummaryStatsWidgets.content("\$${betSummaryStatsByUser.swon}", "Ganado"),
                        BetSummaryStatsWidgets.content("\$${betSummaryStatsByUser.slost}", "Perdido"),
                      ],
                    ),
                    Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BetSummaryStatsWidgets.content("\$${double.parse((betSummaryStatsByUser.mwon).toStringAsFixed(2))}", "Ganancia", width: 180.0),
                      ],
                    ),
                    /*
                    SizedBox(height: _height / 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Última apuesta: ${betSummaryStatsByUser.lastBetDate}", style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),)
                      ],
                    )

                     */
                  ]
                )
              )
            ])


    );
  }
}

