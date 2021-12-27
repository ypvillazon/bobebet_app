
import 'package:bobebet_app/models/bet_summary_stats_by_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BetSummaryStatsByUserFunctions {

  static Widget bar(_width, BetSummaryStatsByUser betSummaryStatsByUser) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Usuario: ",  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
            Text(betSummaryStatsByUser.user,  style: TextStyle(color: Colors.black, fontSize: 14)),
          ],
        )
      ]
    );
  }

  static Widget content(dynamic data, String title) {
    return Container(
        height: 45,
        width: 60,
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