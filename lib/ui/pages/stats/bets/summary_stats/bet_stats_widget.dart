import 'dart:ui';
import 'package:bobebet_app/models/stats/bet_summary_stats.dart';
import 'package:bobebet_app/ui/pages/stats/bets/summary_stats/event_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BetStatsWidget extends StatefulWidget {
  final BetSummaryStats betSummaryStats;

  BetStatsWidget({Key? key, required this.betSummaryStats}) : super(key: key);

  @override
  _BetStatsWidget createState() => new _BetStatsWidget();
}

class _BetStatsWidget extends State<BetStatsWidget> {

  late BetSummaryStats betSummaryStats ;
  bool loading = false ;
  bool error = false;
  bool isFavorite = false ;
  late double _height;
  late double _width;

  @override
  void initState() {
    betSummaryStats = widget.betSummaryStats ;
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
                    BetSummaryStatsWidgets.bar(_width, betSummaryStats),
                    SizedBox(height: _height / 70),
                    Text("Balance de cantidades", style: TextStyle(color: Colors.black54),),
                    Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        BetSummaryStatsWidgets.content("${betSummaryStats.total}", "Total"),
                        BetSummaryStatsWidgets.content("${betSummaryStats.wail}", "Espera"),
                        BetSummaryStatsWidgets.content("${betSummaryStats.won}", "Ganado"),
                        BetSummaryStatsWidgets.content("${betSummaryStats.lost}", "Perdido"),
                      ],
                    ),
                    Text(""),
                    Text("Balance del dinero", style: TextStyle(color: Colors.black54),),
                    Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        BetSummaryStatsWidgets.content("\$${betSummaryStats.stotal}", "Total"),
                        BetSummaryStatsWidgets.content("\$${betSummaryStats.swail}", "Espera"),
                        BetSummaryStatsWidgets.content("\$${betSummaryStats.swon}", "Ganado"),
                        BetSummaryStatsWidgets.content("\$${betSummaryStats.slost}", "Perdido"),
                      ],
                    ),
                    Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BetSummaryStatsWidgets.content("\$${double.parse((betSummaryStats.mwon).toStringAsFixed(2))}", "Ganancia", width: 180.0),
                      ],
                    )
                  ]
                )
              )
            ])


    );
  }
}

