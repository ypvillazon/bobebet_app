import 'dart:ui';
import 'package:bobebet_app/models/bet.dart';
import 'package:bobebet_app/services/create_bet_service.dart';
import 'package:bobebet_app/services/get_conclude_event_service.dart';
import 'package:bobebet_app/ui/pages/change_status_event/events_without_finish_card_widget_functions.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bobebet_app/models/event/event.dart';

class EventsWithOutFinishCardWidget extends StatefulWidget {
  final Event event;
  final dynamic updateFinishEvents ;

  EventsWithOutFinishCardWidget({Key? key, required this.event, this.updateFinishEvents}) : super(key: key);

  @override
  _EventsWithOutFinishCardWidgetState createState() => new _EventsWithOutFinishCardWidgetState();
}

class _EventsWithOutFinishCardWidgetState extends State<EventsWithOutFinishCardWidget> {

  GetConcludeEventService getConcludeEventService = new GetConcludeEventService();
  late Event event;
  late double _height;
  bool loading = false;

  @override
  void initState() {
    event = widget.event;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Event e = event;
    _height = MediaQuery
        .of(context)
        .size
        .height;
    dynamic width = MediaQuery
        .of(context)
        .size
        .width;

    return Card(
        key: UniqueKey(),
        color: Colors.white,
        child: loading
            ?
        HelperFunctions.updating(width)
            :Column(
            children: [
              new Container(
                height: (loading ? 260 : null),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.warning, color: Colors.redAccent.shade100,),
                    Text("Debe estar seguro del equipo que va seleccionar como ganador o si es empate el partido, esta acción no se puede revertir.", textAlign: TextAlign.center, style: TextStyle(color: Colors.redAccent.shade100, fontSize: 14),),
                    Text(""),
                    ListTile(
                      leading: new Image.asset(
                        'assets/images/football.png',
                        width: 40,
                        height: 40,
                      ),
                      title: Text("${e.teamHomeName} vs ${e.teamAwayName}",
                        style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),),
                      subtitle: Text("${e.event}",
                        style: TextStyle(fontSize: 12),),
                    ),
                    Text("", style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    SizedBox(height: _height / 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        EventsWithOutFinishCardWidgetFunctions.content(showConfirmationDialog, e.teamHomeName, e.eventId),
                        EventsWithOutFinishCardWidgetFunctions.content(showConfirmationDialog, "draw", e.eventId),
                        EventsWithOutFinishCardWidgetFunctions.content(showConfirmationDialog, e.teamAwayName, e.eventId)
                      ],
                    ),
                    SizedBox(height: _height / 70),
                    EventsWithOutFinishCardWidgetFunctions.navigatorCardBar(width, e)
                  ],
                ),
              ),
            ])


    );
  }

  showConfirmationDialog(String team, String eventId) {  // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed:  () {
        Navigator.of(context).pop() ;
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Aceptar"),
      onPressed:  () {
        Navigator.of(context).pop() ;
        securityAlert(context, team, eventId) ;
      },
    );  // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("CONFIRMACIÓN", textAlign: TextAlign.center),
      content: Text("¿Está seguro que desea establecer ${(team=="draw") ? "como empate" : "como ganador a ${team} en"} el partido?", textAlign: TextAlign.center),
      actions: [
        cancelButton,
        continueButton,
      ],
    );  // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  securityAlert(BuildContext context, String team, String eventId) {  // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed:  () {
        Navigator.of(context).pop() ;
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Estoy seguro"),
      onPressed:  () {
        //Navigator.of(context).pop() ;
        concludeGame(eventId, team) ;
      },
    );  // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("CONFIRMACIÓN DE SEGURIDAD", textAlign: TextAlign.center),
      content: Text("Alerta de seguridad, esta accion no se puede deshacer.\n\n¿Está seguro que desea establecer ${(team=="draw") ? "como empate" : "como ganador a ${team} en"} el partido?", textAlign: TextAlign.center),
      actions: [
        cancelButton,
        continueButton,
      ],
    );  // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void concludeGame(String eventId, String teamBetName) {
    Navigator.of(context).pop();
    setState(() {
      loading = true;
    });
    getConcludeEventService.conclude(eventId, teamBetName).then((value) => {
      if (value.statusCode == 0) {
        setState(() {
          loading = false;
        }),
        widget.updateFinishEvents()
      } else {
        setState(() {
          loading = false;
        }),
        MessageWidget.error(context, value.message, 4)
      }
    });
  }

}

