import 'package:another_flushbar/flushbar.dart';
import 'package:bobebet_app/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MessageWidget  {

  static void expired(BuildContext context) {
    Flushbar(
      title: 'Sesión expirada',
      message: "Su token ha expirado o a iniciado session en otro dispositivo, para continuar debe autenticarse nuevamente en este botón",
      icon: Icon(
        Icons.error,
        size: 28,
        color: Colors.red,
      ),
      leftBarIndicatorColor: Colors.red,
      duration: Duration(seconds: 6),
      mainButton: TextButton(
        child: Text('Iniciar sesion', style: TextStyle(color: Theme.of(context).accentColor)),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage(from: 5)),
          );
        },
      )
    )..show(context);
  }

  static void info(BuildContext context, String message, int seconds, {pos=FlushbarPosition.BOTTOM}) {
    Flushbar(
    flushbarPosition: pos,
      title: 'Información',
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: seconds),
    )..show(context);
  }

  static void warn(BuildContext context, String message, int seconds, {pos=FlushbarPosition.BOTTOM}) {
    Flushbar(
      flushbarPosition: pos,
      title: 'Advertencia',
      message: message,
      icon: Icon(
        Icons.warning,
        size: 28,
        color: Colors.deepOrangeAccent,
      ),
      leftBarIndicatorColor: Colors.deepOrangeAccent,
      duration: Duration(seconds: seconds),
    )..show(context);
  }

  static void error(BuildContext context, String? message, int seconds, {pos=FlushbarPosition.BOTTOM}) {
    Flushbar(
      flushbarPosition: pos,
      title: 'Error',
      message: (message != null && message != "") ? message : "A ocurrido un error interno.",
      icon: Icon(
        Icons.error,
        size: 28,
        color: Colors.red,
      ),
      leftBarIndicatorColor: Colors.red,
      duration: Duration(seconds: seconds),
    )..show(context);
  }

  static void expiredVersion(BuildContext context) {
    Flushbar(
        title: 'Versión de la aplicación caducada',
        message: "La versión de la aplicación que esta utilizando ha caducado, debe ponerse en contacto con su proveeder de apuestas para actualizarla.",
        icon: Icon(
          Icons.error,
          size: 28,
          color: Colors.red,
        ),
        leftBarIndicatorColor: Colors.red,
        duration: Duration(seconds: 6),
        /*
        mainButton: FlatButton(
          child: Text('Iniciar sesion', style: TextStyle(color: Theme.of(context).accentColor)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(from: 5)),
            );
          },
        )
         */
    )..show(context);
  }

}