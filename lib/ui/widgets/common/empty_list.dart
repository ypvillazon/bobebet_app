import 'package:flutter/material.dart';

class EmptyLists {

  static Widget emptyListsMessage(double height, String msg, Color color) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Column(
              children: [
                SizedBox(height: height),
                Icon(Icons.info_outline, color: color, size: 40,),
                SizedBox(height: 15),
                Text(msg, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color), textAlign: TextAlign.center)
              ],
            )
        )
    ) ;
  }

}