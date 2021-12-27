
import 'package:bobebet_app/models/bet.dart';
import 'package:bobebet_app/models/event/baseball/equipo_en_hacer_carreras.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/services/create_bet_service.dart';
import 'package:bobebet_app/services/get_one_event_service.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/options/carreras.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/options/carreras_desenlace.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/options/equipo_hacer_carreras.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_baseball/options/extra_innings.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/football_goles_desenlaces.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/football_marcadores_finales.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/football_marcadores_primer_tiempo.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/football_marcadores_segundo_tiempo.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/football_margen_de_victoria.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/football_tiempo_con_mas_goles.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/football_tiempo_con_mas_goles_a.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/football_tiempo_con_mas_goles_h.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/football_tiempo_del_primer_gol.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/ganar_partido_con_handicap.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/goles.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/paridad.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/options/apuesta_a_resultado.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/options/cantidad_de_sets.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/options/ganador_sets.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/options/primer_set_y_partido.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/options/total_de_sets.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_tennis/options/total_juegos_dos_desenlace.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TennisSeguirApostandoHomePage extends StatefulWidget {

  final GlobalKey expansionTileKey = GlobalKey();

  final Event event;
  final dynamic updatedCredit;
  final double credit;

  TennisSeguirApostandoHomePage(
      {Key? key, required this.event, this.updatedCredit, required this.credit})
      : super(key: key);

  @override
  _SeguirApostandoHomePageState createState() => _SeguirApostandoHomePageState();

}

class _SeguirApostandoHomePageState extends State<TennisSeguirApostandoHomePage> {

  CreateBetService createBetService = new CreateBetService();
  TextEditingController creditController = new TextEditingController();
  final FocusNode _betCreditTextFocusNode = FocusNode();
  GetOneEventService _getOneEventService = new GetOneEventService() ;

  late Event event;
  dynamic updatedCredit;
  late double credit;
  late IconData expand ;

  String creditBet = "0.0";
  String msg = "Actualizando...";
  GlobalKey<FormState> _key = GlobalKey();
  bool loading = false;

  int _selectedTabIndex = 0;

  @override
  void initState() {
    expand = Icons.expand_more ;
    credit = widget.credit;
    event = widget.event;
    updatedCredit = widget.updatedCredit ;
    super.initState();
  }

  void _updateEvent() {
    _getOneEventService.get(event.eventId).then((value) {
      if (value.statusCode == 0) {
        setState(() {
          event = value.event ;
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

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(child: Column(children: [
          SizedBox(height: 40),
          Buttons.backButton(context, color: Colors.white),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 5,top: 5, bottom: 5),
                  padding: EdgeInsets.only(right: 5,top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  child: Text("  \$${double.parse((credit).toStringAsFixed(2))}", style: TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.bold),),
                )]),
          Card(
              key: UniqueKey(),
              color: Colors.white,
              child: ListTile(
                leading: _sportImage(event.sportType),
                title: Text("${event.teamHomeName} vs ${event.teamAwayName}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                subtitle: Text("${event.event}", style: TextStyle(fontSize: 12),),
              )
          ),
          (loading)
              ?
                HelperFunctions.loading1()
              :
          Expanded(
              child: (_selectedTabIndex == 0) ? handicap() : (_selectedTabIndex == 1) ? medias() : sets()
          )
        ]),
            color: Colors.deepPurple
        ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.update, color: Colors.white),
              title: Text("Resultado", style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.threed_rotation, color: Colors.white),
              title: Text("Medias", style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.adjust, color: Colors.white),
              title: Text("Sets", style: TextStyle(color: Colors.white))
          )
        ],
      ),
    );
  }



  Widget accordionElement(String title, IconData icon, List<Widget> body) {
    final GlobalKey expansionTileKey = GlobalKey();
    return Material(
      color: Colors.transparent,
      child: Theme(
        data: ThemeData(accentColor: Colors.white),
        child: ExpansionTile(
          key: expansionTileKey,
          onExpansionChanged: (value) {
            if (value) { // Checkingex
              _scrollToSelectedContent(expansionTileKey: expansionTileKey);
            }
          },
          leading: Icon(
            Icons.label,
            size: 30,
            color: Colors.white,
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
          children: body,
          trailing: Icon(expand, color: Colors.white)
          ),
      ),
    );
  }

  void _scrollToSelectedContent({required GlobalKey expansionTileKey}) {
    final keyContext = expansionTileKey.currentContext;
    if (keyContext != null) {
      Future.delayed(Duration(milliseconds: 200)).then((value) {
        Scrollable.ensureVisible(keyContext,
            duration: Duration(milliseconds: 200));
      });
    }
  }

  void createBet(String targetName, String targetDescription, double coeff, betType) {
    Navigator.of(context).pop();
    setState(() {
      msg = "Creando la apuesta ...";
      loading = true;
    });
    createBetService.create(new Bet(double.parse(creditBet), widget.event.eventId, targetName, targetDescription, coeff, betType)).then((value) {
      if (value.statusCode == 0) {
        setState(() {
          loading = false;
          widget.updatedCredit(double.parse(creditBet));
          setState(() {
            credit = credit - double.parse(creditBet);
          });
          this._updateEvent();
        });
        MessageWidget.info(context, "Apuesta realizada con exito.", 3);
      } else {
        setState(() {
          loading = false;
        });
        MessageWidget.error(context, value.message, 4);
      }
    });
  }

  _createBetForm(String teamBetName, String targetDescription, double teamCoeff, betType, text) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
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
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "APOSTAR",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
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
                        child: Fields.doubleField("Cantidad a apostar", _onChanceCredit, creditController, focusNode: _betCreditTextFocusNode),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Buttons.dialogButton(
                                      () => {Navigator.of(context).pop()},
                                  context,
                                  "Cancelar",
                                  Colors.redAccent),
                              Buttons.dialogButton(
                                      () => {createBet(teamBetName, targetDescription, teamCoeff, betType)},
                                  context,
                                  "Apostar",
                                  Colors.green)
                            ],
                          ))
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
      creditBet = v;
    });
  }

  Widget _sportImage(String s) {
    String sport = "tennis.png" ;
    return new Image.asset(
      'assets/images/' + sport,
      width: 40,
      height: 40,
    ) ;
  }

  Widget handicap() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          (event.apuestaAResultadoDto.available) ?
          accordionElement(
              event.apuestaAResultadoDto.title,
              Icons.arrow_right,
              ApuestaAResultado.get(event.apuestaAResultadoDto, _createBetForm)
          ) :
          Container(),

          (event.ganarPartidoConHandicapDto.available) ?
          accordionElement(
              event.ganarPartidoConHandicapDto.title,
              Icons.system_update_alt,
              GanarPartidoConHandicapElement.get(event.ganarPartidoConHandicapDto, _createBetForm, "TN_GANAR_PARTIDO_HANDICAP",_onMsg)
          ) :
          Container(),

          // FT_GANAR_PARTIDO_HANDICAP
          (event.ganarPartidoConHandicapAsiaticoDto.available) ?
          accordionElement(
              event.ganarPartidoConHandicapAsiaticoDto.title,
              Icons.system_update_alt,
              GanarPartidoConHandicapElement.get1(event.ganarPartidoConHandicapAsiaticoDto, _createBetForm, "TN_GANAR_PARTIDO_HANDICAP_ASIATICO",_onMsg)
          ) :
          Container()
        ]
    );
  }

  Widget sets() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          (event.ganadorPrimerSetsDto.available) ?
          accordionElement(
              event.ganadorPrimerSetsDto.title,
              Icons.arrow_right,
              GanadorPorSets.get(event.ganadorPrimerSetsDto, _createBetForm, "TN_GANADOR_PRIMER_SET")
          ) :
          Container(),

          (event.ganadorSegundoSetsDto.available) ?
          accordionElement(
              event.ganadorSegundoSetsDto.title,
              Icons.arrow_right,
              GanadorPorSets.get(event.ganadorSegundoSetsDto, _createBetForm, "TN_GANADOR_SEGUNDO_SET")
          ) :
          Container(),

          (event.ganaPrimerSetYGanaPartido.available || event.pierdePrimerSetYGanaPartido.available) ?
          accordionElement(
              "Primer set y partido",
              Icons.arrow_right,
              PrimerSetyPartido.get(event, _createBetForm)
          ) :
          Container(),

          (event.totalDeSetsDto.available) ?
          accordionElement(
              event.totalDeSetsDto.title,
              Icons.arrow_right,
              TotalDeSets.get(event.totalDeSetsDto, _createBetForm)
          ) :
          Container(),

          (event.cantidadDeSetsDto.available) ?
          accordionElement(
              event.cantidadDeSetsDto.title,
              Icons.arrow_right,
              CantidadDeSets.get(event.cantidadDeSetsDto, _createBetForm)
          ) :
          Container()
        ]
    );
  }


  Widget medias() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          (event.totalDeJuegos.available) ?
          accordionElement(
              event.totalDeJuegos.title,
              Icons.arrow_right,
              TotalJuegosDosDesenlace.get(event.totalDeJuegos, _createBetForm, "TN_TOTAL_JUEGOS", _onMsg)
          ) :
          Container(),
          (event.totalDeJuegosGanadosH.available) ?
          accordionElement(
              event.totalDeJuegosGanadosH.title,
              Icons.arrow_right,
              TotalJuegosDosDesenlace.get(event.totalDeJuegosGanadosH, _createBetForm, "TN_TOTAL_JUEGOS_GANADOS_H", _onMsg)
          ) :
          Container(),
          (event.totalDeJuegosGanadosA.available) ?
          accordionElement(
              event.totalDeJuegosGanadosA.title,
              Icons.arrow_right,
              TotalJuegosDosDesenlace.get(event.totalDeJuegosGanadosA, _createBetForm, "TN_TOTAL_JUEGOS_GANADOS_A", _onMsg)
          ) :
          Container(),
          (event.totalDeJuegosPrimerSet.available) ?
          accordionElement(
              event.totalDeJuegosPrimerSet.title,
              Icons.arrow_right,
              TotalJuegosDosDesenlace.get(event.totalDeJuegosPrimerSet, _createBetForm, "TN_TOTAL_JUEGOS_PRIMER_SET", _onMsg)
          ) :
          Container(),
          (event.totalDeJuegosPrimerSetH.available) ?
          accordionElement(
              event.totalDeJuegosPrimerSetH.title,
              Icons.arrow_right,
              TotalJuegosDosDesenlace.get(event.totalDeJuegosPrimerSetH, _createBetForm, "TN_TOTAL_JUEGOS_GANADOS_H_PRIMER_SET", _onMsg)
          ) :
          Container(),
          (event.totalDeJuegosPrimerSetA.available) ?
          accordionElement(
              event.totalDeJuegosPrimerSetA.title,
              Icons.arrow_right,
              TotalJuegosDosDesenlace.get(event.totalDeJuegosPrimerSetA, _createBetForm, "TN_TOTAL_JUEGOS_GANADOS_A_PRIMER_SET", _onMsg)
          ) :
          Container(),
          (event.totalDeJuegosSegundoSetH.available) ?
          accordionElement(
              event.totalDeJuegosSegundoSetH.title,
              Icons.arrow_right,
              TotalJuegosDosDesenlace.get(event.totalDeJuegosSegundoSetH, _createBetForm, "TN_TOTAL_JUEGOS_GANADOS_H_SEGUNDO_SET", _onMsg)
          ) :
          Container(),
          (event.totalDeJuegosSegundoSetA.available) ?
          accordionElement(
              event.totalDeJuegosSegundoSetA.title,
              Icons.arrow_right,
              TotalJuegosDosDesenlace.get(event.totalDeJuegosSegundoSetA, _createBetForm, "TN_TOTAL_JUEGOS_GANADOS_A_SEGUNDO_SET", _onMsg)
          ) :
          Container(),
        ]
    );
  }

  _onMsg(String v) {
    MessageWidget.info(context, "Las apuestas para ${v} están cerradas, actualice e inténtelo más tarde.", 5);
  }

  _changeIndex(int index) {
    if (index == 0) {
      setState(() {
        _selectedTabIndex = 0;
      });
    }
    if (index == 1) {
      setState(() {
        _selectedTabIndex = 1;
      });
    }
    if (index == 2) {
      setState(() {
        _selectedTabIndex = 2;
      });
    }
  }

}

