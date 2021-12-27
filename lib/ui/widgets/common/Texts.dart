import 'package:bobebet_app/configuration/configuration.dart';
import 'package:flutter/material.dart';

class Texts {

  static Widget title1({double anmation=1}) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'B',
          style: TextStyle(
            //textStyle: Theme.of(context).textTheme.display1,
            fontSize: anmation*60,
            fontWeight: FontWeight.w700,
            color: Colors.deepPurple,
          ),
          children: [
            TextSpan(
              text: 'obe',
              style: TextStyle(color: Colors.grey, fontSize: anmation*40),
            ),
            TextSpan(
              text: 'B',
              style: TextStyle(
                //textStyle: Theme.of(context).textTheme.display1,
                fontSize: anmation*40,
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple,
              ),
            ),
            TextSpan(
              text: 'et',
              style: TextStyle(color: Colors.grey, fontSize: anmation*30),
            ),
          ]),
    );
  }

  static Widget title2({double anmation=1}) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '          apuestas deportivas',
        style: TextStyle(
          height: -50,
          //textStyle: Theme.of(context).textTheme.display1,
          fontSize: anmation*15,
          fontWeight: FontWeight.w700,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  static Widget version({double anmation=1}) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '                                     ${VERSION}',
        style: TextStyle(
          height: 1.5,
          //textStyle: Theme.of(context).textTheme.display1,
          fontSize: anmation*13,
          fontWeight: FontWeight.w700,
          color: Colors.blue,
        ),
      ),
    );
  }

}
