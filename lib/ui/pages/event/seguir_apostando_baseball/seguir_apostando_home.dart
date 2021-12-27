
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
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BaseSeguirApostandoHomePage extends StatefulWidget {

  final GlobalKey expansionTileKey = GlobalKey();

  final Event event;
  final dynamic updatedCredit;
  final double credit;

  BaseSeguirApostandoHomePage(
      {Key? key, required this.event, this.updatedCredit, required this.credit})
      : super(key: key);

  @override
  _SeguirApostandoHomePageState createState() => _SeguirApostandoHomePageState();

}

class _SeguirApostandoHomePageState extends State<BaseSeguirApostandoHomePage> {

  CreateBetService createBetService = new CreateBetService();
  TextEditingController creditController = new TextEditingController();
  final FocusNode _betCreditTextFocusNode = FocusNode();
  GetOneEventService _getOneEventService = new GetOneEventService() ;


  late Event event;
  late dynamic updatedCredit;
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
              child: (_selectedTabIndex == 0) ? entradas() : (_selectedTabIndex==1) ? carreras() :  paridad()
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
              icon: Icon(Icons.system_update_alt, color: Colors.white),
              title: Text("Entradas", style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.adjust, color: Colors.white),
              title: Text("Medias", style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.wifi_tethering, color: Colors.white),
              title: Text("Paridad", style: TextStyle(color: Colors.white))
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


  Widget entradas() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          (event.resultadoPrimerasCincoEntradas.available || event.resultadoPrimeraEntrada.available || event.resultadoSegundaEntrada.available) ?
          accordionElement(
              "Resultados por entradas",
              Icons.arrow_right,
              CarrerasPorEntrada.get(event, _createBetForm)
          ) :
          Container(),

          (event.ganarPartidoConHandicapDto.available) ?
          accordionElement(
              event.ganarPartidoConHandicapDto.title,
              Icons.system_update_alt,
              GanarPartidoConHandicapElement.get(event.ganarPartidoConHandicapDto, _createBetForm, "BS_GANAR_PARTIDO_HANDICAP",_onMsg)
          ) :
          Container(),

          // FT_GANAR_PARTIDO_HANDICAP
          (event.ganarPartidoConHandicapAsiaticoDto.available) ?
          accordionElement(
              event.ganarPartidoConHandicapAsiaticoDto.title,
              Icons.system_update_alt,
              GanarPartidoConHandicapElement.get1(event.ganarPartidoConHandicapAsiaticoDto, _createBetForm, "BS_GANAR_PARTIDO_HANDICAP_ASIATICO",_onMsg)
          ) :
          Container(),

          (event.extraIningsDto.available) ?
          accordionElement(
              event.extraIningsDto.title,
              Icons.arrow_right,
              ExtraInnings.get(event, _createBetForm)
          ) :
          Container(),

          (event.primerEquipo.available || event.ultimoEquipo.available) ?
          accordionElement(
              "Orden de las carreras",
              Icons.arrow_right,
              EquipoEnHacerCarrerasList.get(event, _createBetForm)
          ) :
          Container()
        ]
    );
  }

  _onMsg(String v) {
    MessageWidget.info(context, "Las apuestas para ${v} están cerradas, actualice e inténtelo más tarde.", 5);
  }

  Widget carreras() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          (event.totalCarrerasDesenlacePartido.available) ?
          accordionElement(
              event.totalCarrerasDesenlacePartido.title,
              Icons.arrow_right,
              CarrerasDesenlace.get(event.totalCarrerasDesenlacePartido, _createBetForm, "BS_DESENLACE_PARTIDO", _onMsg)
          ) :
          Container(),

          (event.totalCarrerasDesenlaceH.available) ?
          accordionElement(
              event.totalCarrerasDesenlaceH.title,
              Icons.arrow_right,
              CarrerasDesenlace.get(event.totalCarrerasDesenlaceH, _createBetForm, "BS_DESENLACE_PARTIDO_H", _onMsg)
          ) :
          Container(),

          (event.totalCarrerasDesenlaceA.available) ?
          accordionElement(
              event.totalCarrerasDesenlaceA.title,
              Icons.arrow_right,
              CarrerasDesenlace.get(event.totalCarrerasDesenlaceA, _createBetForm, "BS_DESENLACE_PARTIDO_A", _onMsg)
          ) :
          Container(),

          (event.totalCarrerasDesenlacePrimeraEntrada.available) ?
          accordionElement(
              event.totalCarrerasDesenlacePrimeraEntrada.title,
              Icons.arrow_right,
              CarrerasDesenlace.get(event.totalCarrerasDesenlacePrimeraEntrada, _createBetForm, "BS_DESENLACE_PRIMERA_ENTRADA", _onMsg)
          ) :
          Container(),

          (event.totalCarrerasDesenlaceSegundaEntrada.available) ?
          accordionElement(
              event.totalCarrerasDesenlaceSegundaEntrada.title,
              Icons.arrow_right,
              CarrerasDesenlace.get(event.totalCarrerasDesenlaceSegundaEntrada, _createBetForm, "BS_DESENLACE_SEGUNDA_ENTRADA", _onMsg)
          ) :
          Container(),

          (event.totalCarrerasDesenlacePrimeras5Carreras.available) ?
          accordionElement(
              event.totalCarrerasDesenlacePrimeras5Carreras.title,
              Icons.arrow_right,
              CarrerasDesenlace.get(event.totalCarrerasDesenlacePrimeras5Carreras, _createBetForm, "BS_DESENLACE_PRIMERAS_CINCO_ENTRADAS", _onMsg)
          ) :
          Container()
        ]
    );
  }

  Widget paridad() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          (event.paridadCarrerasPartido.available) ?
          accordionElement(
              event.paridadCarrerasPartido.title,
              Icons.arrow_right,
              Paridad.get(event.paridadCarrerasPartido, _createBetForm, "BS_PARIDAD_TOTAL_CARRERAS")
          ) :
          Container()
        ]
    );
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

