import 'dart:math';
import 'dart:ui';
import 'package:bobebet_app/models/bet.dart';
import 'package:bobebet_app/services/create_bet_service.dart';
import 'package:bobebet_app/services/create_favorite_event_service.dart';
import 'package:bobebet_app/services/delete_favorite_event_service.dart';
import 'package:bobebet_app/services/get_one_event_service.dart';
import 'package:bobebet_app/ui/pages/event/event_widgets.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/seguir_apostando_home.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_basketball/seguir_apostando_home.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_boxing/seguir_apostando_home.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_fa/seguir_apostando_home.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/seguir_apostando_home.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/seguir_apostando_home.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bobebet_app/models/event/event.dart';

class EventCardWidget extends StatefulWidget {
  final Event event;
  final dynamic updatedCredit ;
  final double credit ;

  EventCardWidget({Key? key, required this.event, this.updatedCredit, required this.credit}) : super(key: key);

  @override
  _EventCardWidget createState() => new _EventCardWidget();
}

class _EventCardWidget extends State<EventCardWidget> {

  GetOneEventService _getOneEventService = new GetOneEventService() ;
  CreateFavoriteEventService createFavoriteEventService = new CreateFavoriteEventService() ;
  DeleteFavoriteEventService deleteFavoriteEventService = new DeleteFavoriteEventService() ;
  CreateBetService createBetService = new CreateBetService() ;

  TextEditingController creditController = new TextEditingController() ;
  final FocusNode _betCreditTextFocusNode = FocusNode();

  String msg = "Actualizando..." ;

  GlobalKey<FormState> _key = GlobalKey();

  String creditBet = "0.0" ;

  late Event event ;
  bool loading = false ;
  bool error = false;
  bool isFavorite = false ;
  late double _height;
  late double _width;

  @override
  void initState() {
    event = widget.event ;
  }

  @override
  void dispose() {
    _betCreditTextFocusNode.dispose();
    super.dispose();
  }

  void createBet(String teamBetName, double teamCoeff, String sport) {
    Navigator.of(context).pop();
    setState(() {
      msg="Creando la apuesta ..." ;
      loading=true;
    });

    /**
     * Tipo de apuestas por deporte.
     */
    String betType = "FT_WINNING_TEAM" ;
    if(sport == "Basketball"){
      betType = "BK_WINNING_TEAM" ;
    }
    if(sport == "Baseball"){
      betType = "BS_WINNING_TEAM" ;
    }
    if(sport == "Tennis") {
      betType = "TN_WINNING_TEAM" ;
    }
    if(sport == "Boxing") {
      betType = "BX_WINNING_TEAM" ;
    }

    createBetService.create(new Bet(double.parse(creditBet), event.eventId, teamBetName, teamBetName, teamCoeff, betType)).then((value) {
      if (value.statusCode == 0) {
        setState(() {
          widget.updatedCredit(double.parse(creditBet)) ;
        });
        setState(() {
          msg="Actualizando ..." ;
          loading=true;
        });
        _getOneEventService.get(event.eventId).then((value) {
          if (value.statusCode == 0) {
            setState(() {
              error=false;
              event = value.event ;
              loading = false ;
            });
            MessageWidget.info(context, "Apuesta realizada con exito.", 3);
          } else {
            setState(() {
              error=true;
              loading = false ;
            });
            MessageWidget.error(context, value.message, 4);
          }
        });

      } else {
        setState(() { loading = false ; });
        MessageWidget.error(context, value.message, 4);
      }
    });
  }

  void _updateEvent() {
    setState(() {
      msg="Actualizando ..." ;
      loading=true;
    });
    _getOneEventService.get(event.eventId).then((value) {
      if (value.statusCode == 0) {
        setState(() {
          error=false;
          event = value.event ;
          loading = false ;
        });
      } else {
        setState(() {
          error=true;
          loading = false ;
        });
        MessageWidget.error(context, value.message, 4);
      }
    });
  }

  updatedCredit(double credit) {
    widget.updatedCredit(credit) ;
    _updateEvent();
  }

  @override
  Widget build(BuildContext context) {
    Event e = event ;
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
                child:
                loading
                    ?
                  HelperFunctions.updating(_width, msg: msg)
                 :
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EventsWidgets.navigatorCardBar(_width, e, _updateEvent),
                    ListTile(
                      leading: _sportImage(e.sportType),
                      title: GestureDetector(
                          onTap: () => {
                            _seguirApostando()
                          },
                          child: Row(
                            children: [
                              Text(((e.teamHomeName.length>9) ? e.teamHomeName.substring(0,9) + "..." : e.teamHomeName), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                              Text(" vs ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                              Text(((e.teamAwayName.length>9) ? e.teamAwayName.substring(0,9) + "..." : e.teamAwayName), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple))
                            ],
                          )
                      ),
                      subtitle: Text("${e.event}", style: TextStyle(fontSize: 12),),
                    ),
                    Text("",style: TextStyle(color: Colors.black.withOpacity(0.8))),
                    SizedBox(height: _height / 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        EventsWidgets.betContent(_createBetForm, e.teamHomeName, e.teamHomeCoeff, e.teamHomeCoeffUp, e.showHome, e.sport, _onMsg, (e.sport == "Baseball" || e.sport == "Basketball" || e.sport == "Tennis" || e.sport == "Boxing" ? 140 : 100)),
                        (e.sport != "Baseball" && e.sport != "Basketball" && e.sport != "Tennis" && e.sport != "Boxing")
                            ?
                               EventsWidgets.betContent(_createBetForm, "draw", e.drawCoeff, e.drawCoeffUp, e.showDraw, e.sport, _onMsg, 100)
                            :
                               Container()
                        ,
                        EventsWidgets.betContent(_createBetForm, e.teamAwayName, e.teamAwayCoeff, e.teamAwayCoeffUp, e.showAway,e.sport, _onMsg, (e.sport == "Baseball" || e.sport == "Basketball" || e.sport == "Tennis" || e.sport == "Boxing" ? 140 : 100)),
                      ],
                    )
                  ]
                )
              )
            ])


    );
  }

  _seguirApostando() async {
    if(widget.event.sportType == "FT") {
      dynamic r = await Navigator.push(context, MaterialPageRoute(builder: (context) =>  FootSeguirApostandoHomePage(event: event, updatedCredit: updatedCredit, credit: widget.credit)));
      _updateEvent();
    }
    if(widget.event.sportType == "BK") {
      dynamic r = await Navigator.push(context, MaterialPageRoute(builder: (context) =>  BasketSeguirApostandoHomePage(event: event, updatedCredit: updatedCredit, credit: widget.credit)));
      _updateEvent();
    }
    if(widget.event.sportType == "BS") {
      dynamic r = await Navigator.push(context, MaterialPageRoute(builder: (context) =>  BaseSeguirApostandoHomePage(event: event, updatedCredit: updatedCredit, credit: widget.credit)));
      _updateEvent();
    }
    if(widget.event.sportType == "TN") {
      dynamic r = await Navigator.push(context, MaterialPageRoute(builder: (context) =>  TennisSeguirApostandoHomePage(event: event, updatedCredit: updatedCredit, credit: widget.credit)));
      _updateEvent();
    }
    if(widget.event.sportType == "BX") {
      dynamic r = await Navigator.push(context, MaterialPageRoute(builder: (context) =>  BoxingSeguirApostandoHomePage(event: event, updatedCredit: updatedCredit, credit: widget.credit)));
      _updateEvent();
    }
    if(widget.event.sportType == "FA") {
      dynamic r = await Navigator.push(context, MaterialPageRoute(builder: (context) =>  FASeguirApostandoHomePage(event: event, updatedCredit: updatedCredit, credit: widget.credit)));
      _updateEvent();
    }
  }

  _createBetForm(String teamBetName, double teamCoeff, String sport) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)
            ),
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  //right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      height: 40,
                      width: 230,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("APOSTAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                Form(
                  key: _key,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Esta a punto de realizar una apuesta a favor de " + ((teamBetName=='draw') ? "empate" : teamBetName) + ", tenga en cuenta que esta operacion no se puede deshacer.", textAlign: TextAlign.justify, style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Fields.doubleField("Cantidad a apostar", _onChanceCredit, creditController, focusNode: _betCreditTextFocusNode),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Buttons.dialogButton(()=>{Navigator.of(context).pop()}, context, "Cancelar", Colors.redAccent),
                                      Buttons.dialogButton(()=>{createBet(teamBetName, teamCoeff, sport)}, context, "Apostar", Colors.green)
                                    ],
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),


          );
        });
  }

  _onChanceCredit(String v) {
    setState(() {
      creditBet = v ;
    });
  }

  _onMsg(String v) {
    MessageWidget.info(context, "Las apuestas para ${v} están cerradas, actualice e inténtelo más tarde.", 5);
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

