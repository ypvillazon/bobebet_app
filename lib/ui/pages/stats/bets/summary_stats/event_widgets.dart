
import 'package:bobebet_app/models/stats/bet_summary_stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BetSummaryStatsWidgets {


  static Widget bar(_width, BetSummaryStats betSummaryStats) {
    return Column(
        children: <Widget>[
          (betSummaryStats.date != "") ?
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Fecha: ",  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
              Text(betSummaryStats.date,  style: TextStyle(color: Colors.black, fontSize: 14)),
            ],
          ) : Container(),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text( ((betSummaryStats.tags.length>40) ? betSummaryStats.tags.substring(0,40) + "..." : betSummaryStats.tags),  style: TextStyle(color: Colors.deepPurple, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 15),

        ]
    );
  }

  static Widget content(dynamic data, String title, {width=60.0}) {
    return Container(
        height: 45,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: new LinearGradient(colors: [Colors.deepPurple, Colors.deepPurple.shade400], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            Text(data, style: TextStyle(color: Colors.white, fontSize: 12))
          ],
        ),
    );
  }

}