
import 'package:bobebet_app/models/bet.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/models/event/football/equipo_en_hacer.dart';
import 'package:bobebet_app/models/event/football/options_total_goles.dart';
import 'package:bobebet_app/services/create_bet_service.dart';
import 'package:bobebet_app/services/get_one_event_service.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/equipo_en_hacer.dart';
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
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/goles_medias.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/paridad.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FootSeguirApostandoHomePage extends StatefulWidget {

  final GlobalKey expansionTileKey = GlobalKey();

  final Event event;
  final dynamic updatedCredit;
  final double credit;

  FootSeguirApostandoHomePage(
      {Key? key, required this.event, this.updatedCredit, required this.credit})
      : super(key: key);

  @override
  _SeguirApostandoHomePageState createState() => _SeguirApostandoHomePageState();

}

class _SeguirApostandoHomePageState extends State<FootSeguirApostandoHomePage> {

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
            child: (_selectedTabIndex == 0) ? marcadoresList() : (_selectedTabIndex==1) ? tiemposList() : (_selectedTabIndex == 2) ? medias() : (_selectedTabIndex == 3) ? golesList() : paridadList()
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
              title: Text("Marcadores", style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.timer, color: Colors.white),
              title: Text("Tiempos", style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.adjust, color: Colors.white),
              title: Text("Medias", style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.map, color: Colors.white),
              title: Text("Goles", style: TextStyle(color: Colors.white))
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
        print("statusCode" + value.statusCode.toString()) ;
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

  Widget marcadoresList() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          // "Marcadores finales"
          (event.coeffPerMarkerByEvent.markers.length != 0) ?
          accordionElement(
              "Marcadores finales",
              Icons.system_update_alt,
              FootballMarcadoresFinales.get(event, _createBetForm, "FT_FINAL_SCORE", " para el marcador de final de partido")
          ) :
          Container()
          ,

          // "Marcadores del 1er tiempo"
          (event.firstHalfMarkers.markers.length != 0) ?
          accordionElement(
              "Marcadores del 1er T",
              Icons.looks_one,
              FootballMarcadoresPrimerTiempo.get(event, _createBetForm, "FT_FIRST_TIME_SCORE", " para el marcador de final del primer tiempo")
          ) :
          Container()
          ,

          // "Marcadores del 2do tiempo"
          (event.secondHalfMarkers.markers.length != 0) ?
          accordionElement(
              "Marcadores del 2do T",
              Icons.looks_two,
              FootballMarcadoresSegundoTiempo.get(event, _createBetForm, "FT_SECOND_TIME_SCORE", " para el marcador de final del segundo tiempo")
          ) :
          Container(),

          // FT_GANAR_PARTIDO_HANDICAP
            (event.ganarPartidoConHandicapDto.available) ?
          accordionElement(
              event.ganarPartidoConHandicapDto.title,
              Icons.system_update_alt,
              GanarPartidoConHandicapElement.get(event.ganarPartidoConHandicapDto, _createBetForm, "FT_GANAR_PARTIDO_HANDICAP",_onMsg)
          ) :
          Container(),

          // FT_GANAR_PARTIDO_HANDICAP
          (event.ganarPartidoConHandicapAsiaticoDto.available) ?
          accordionElement(
              event.ganarPartidoConHandicapAsiaticoDto.title,
              Icons.system_update_alt,
              GanarPartidoConHandicapElement.get1(event.ganarPartidoConHandicapAsiaticoDto, _createBetForm, "FT_GANAR_PARTIDO_HANDICAP_ASIATICO",_onMsg)
          ) :
          Container()
        ]
    );
  }

  Widget tiemposList() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          // "Tiempo del primer gol"
          (event.tiempoConPrimerGol.available) ?
          accordionElement(
              "Tiempo del primer gol",
              Icons.timer,
              FootballTiempoDelPrimerGol.get(event, _createBetForm, "FT_TIEMPO_CON_PRIMER_GOL", " para el tiempo donde se marcó el primer gol")
          ) :
          Container()
          ,

          // "Tiempo con más Goles"
          (event.tiempoConMasGoles.available) ?
          accordionElement(
              "Tiempo con más goles",
              Icons.access_time,
              FootballTiempoConMasGoles.get(event, _createBetForm, "FT_TIEMPO_CON_MAS_GOLES", "para el tiempo con más goles")
          ) :
          Container()
          ,

          //  "Tiempo de más goles para casa",
          (event.tiempoConMasGolesH.available) ?
          accordionElement(
              "Tiempo de más goles para casa",
              Icons.home,
              FootballTiempoConMasGolesH.get(event, _createBetForm, "FT_TIEMPO_CON_MAS_GOLES_TEAM_H", "para el tiempo con más goles para el equipo de casa")
          ) :
          Container()
          ,

          //  "Tiempo de más goles para el visitador"
          (event.tiempoConMasGolesA.available) ?
          accordionElement(
              "Tiempo de más goles para el visitador",
              Icons.account_balance_wallet,
              FootballTiempoConMasGolesA.get(event, _createBetForm, "FT_TIEMPO_CON_MAS_GOLES_TEAM_A", "para el tiempo con más goles para el equipo visitador")
          ) :
          Container()
        ]
    );
  }

  _onMsg(String v) {
    MessageWidget.info(context, "Las apuestas para ${v} están cerradas, actualice e inténtelo más tarde.", 5);
  }

  /*
  Widget desenlacesList() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          //  "Total de goles (3 desenlaces)"
          (event.totalGolesDesenlace.available) ?
          accordionElement(
              "Total de goles",
              Icons.threed_rotation,
              FootballGolesDesenlace.get(event.totalGolesDesenlace, _createBetForm, "FT_TOTAL_GOLES_DESENLACE", _onMsg)
          ) :
          Container()
          ,

          //  "Goles para el 1er tiempo (3 desenlaces)"
          (event.totalGolesPrimerTiempo3DesenlacesDto.available) ?
          accordionElement(
              "Goles para el 1er T",
              Icons.threed_rotation,
              FootballGolesDesenlace.get(event.totalGolesPrimerTiempo3DesenlacesDto, _createBetForm, "FT_TOTAL_GOLES_DESENLACE_PRIMER_TIEMPO", _onMsg)
          ) :
          Container()
          ,

          //  "Goles para el 2do tiempo (3 desenlaces)"
          (event.totalGolesSegundoTiempo3DesenlacesDto.available) ?
          accordionElement(
              "Goles para el 2do T",
              Icons.threed_rotation,
              FootballGolesDesenlace.get(event.totalGolesSegundoTiempo3DesenlacesDto, _createBetForm, "FT_TOTAL_GOLES_DESENLACE_SEGUNDO_TIEMPO", _onMsg)
          ) :
          Container()
          ,

          //  "Goles para casa (3 desenlaces)"
          (event.totalGolesParaCasa3DesenlacesDto.available) ?
          accordionElement(
              "Goles para casa",
              Icons.threed_rotation,
              FootballGolesDesenlace.get(event.totalGolesParaCasa3DesenlacesDto, _createBetForm, "FT_TOTAL_GOLES_DESENLACE_H", _onMsg)
          ) :
          Container()
          ,

          //  "Goles para el visitante (3 desenlaces)"
          (event.totalGolesParaVisitante3DesenlacesDto.available) ?
          accordionElement(
              "Goles para el visitante",
              Icons.threed_rotation,
              FootballGolesDesenlace.get(event.totalGolesParaVisitante3DesenlacesDto, _createBetForm, "FT_TOTAL_GOLES_DESENLACE_A", _onMsg)
          ) :
          Container()
          ,

          //  "Goles para casa (1er tiempo) (3 desenlaces)"
          (event.totalGolesCasaPrimerTiempo3DesenlacesDto.available) ?
          accordionElement(
              "Goles para casa (1er T)",
              Icons.threed_rotation,
              FootballGolesDesenlace.get(event.totalGolesCasaPrimerTiempo3DesenlacesDto, _createBetForm, "FT_TOTAL_GOLES_DESENLACE_PRIMER_TIEMPO_H", _onMsg)
          ) :
          Container()
          ,

          //  "Goles para el visitante (1er tiempo) (3 desenlaces)"
          (event.totalGolesVisitantePrimerTiempo3DesenlacesDto.available) ?
          accordionElement(
              "Goles para el visitante (1er T)",
              Icons.threed_rotation,
              FootballGolesDesenlace.get(event.totalGolesVisitantePrimerTiempo3DesenlacesDto, _createBetForm, "FT_TOTAL_GOLES_DESENLACE_PRIMER_TIEMPO_A", _onMsg)
          ) :
          Container()
          ,

          //  "Goles para casa (2do tiempo) (3 desenlaces)"
          (event.totalGolesCasaSegundoTiempo3DesenlacesDto.available) ?
          accordionElement(
              "Goles para casa (2do T)",
              Icons.threed_rotation,
              FootballGolesDesenlace.get(event.totalGolesCasaSegundoTiempo3DesenlacesDto, _createBetForm, "FT_TOTAL_GOLES_DESENLACE_SEGUNDO_TIEMPO_H", _onMsg)
          ) :
          Container()
          ,

          //  "Goles para el visitante (2do tiempo) (3 desenlaces)"
          (event.totalGolesVisitanteSegundoTiempo3DesenlacesDto.available) ?
          accordionElement(
              "Goles para el visitante (2do T)",
              Icons.threed_rotation,
              FootballGolesDesenlace.get(event.totalGolesVisitanteSegundoTiempo3DesenlacesDto, _createBetForm, "FT_TOTAL_GOLES_DESENLACE_SEGUNDO_TIEMPO_A", _onMsg)
          ) :
          Container()
        ]
    );
  }
  */

  Widget medias() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          mediasItem(event.paraPartido, "FT_TOTAL_GOLES_DESENLACE", "1"),
          mediasItem(event.paraH, "FT_TOTAL_GOLES_DESENLACE_H", "1"),
          mediasItem(event.paraA, "FT_TOTAL_GOLES_DESENLACE_A", "1"),
          mediasItem(event.paraPrimerTiempo, "FT_TOTAL_GOLES_DESENLACE_PRIMER_TIEMPO", "1"),
          mediasItem(event.paraPrimerTiempoH, "FT_TOTAL_GOLES_DESENLACE_PRIMER_TIEMPO_H", "1"),
          mediasItem(event.paraPrimerTiempoA, "FT_TOTAL_GOLES_DESENLACE_PRIMER_TIEMPO_A", "1"),
          mediasItem(event.paraSegundoTiempo, "FT_TOTAL_GOLES_DESENLACE_SEGUNDO_TIEMPO", "1"),
          mediasItem(event.paraSegundoTiempoH, "FT_TOTAL_GOLES_DESENLACE_SEGUNDO_TIEMPO_H", "1"),
          mediasItem(event.paraSegundoTiempoA, "FT_TOTAL_GOLES_DESENLACE_SEGUNDO_TIEMPO_A", "1"),

          mediasItem(event.tirosPorteriaPartido, "FT_TOTAL_GOLES_DESENLACE_TIROS_PORTERIA", "4"),
          mediasItem(event.tirosPorteriaParaH, "FT_TOTAL_GOLES_DESENLACE_TIROS_PORTERIA_H", "4"),
          mediasItem(event.tirosPorteriaParaA, "FT_TOTAL_GOLES_DESENLACE_TIROS_PORTERIA_A", "4"),

          mediasItem(event.cornerPartido, "FT_TOTAL_GOLES_DESENLACE_CORNER", "2"),
          mediasItem(event.cornerParaH, "FT_TOTAL_GOLES_DESENLACE_CORNER_H", "2"),
          mediasItem(event.cornerParaA, "FT_TOTAL_GOLES_DESENLACE_CORNER_A", "2"),
          mediasItem(event.cornerParaPrimerTiempo, "FT_TOTAL_GOLES_DESENLACE_CORNER_PRIMER_TIEMPO", "2"),
          mediasItem(event.cornerParaPrimerTiempoH, "FT_TOTAL_GOLES_DESENLACE_CORNER_PRIMER_TIEMPO_H", "2"),
          mediasItem(event.cornerParaPrimerTiempoA, "FT_TOTAL_GOLES_DESENLACE_CORNER_PRIMER_TIEMPO_A", "2"),
          mediasItem(event.cornerParaSegundoTiempo, "FT_TOTAL_GOLES_DESENLACE_CORNER_SEGUNDO_TIEMPO", "2"),
          mediasItem(event.cornerParaSegundoTiempoH, "FT_TOTAL_GOLES_DESENLACE_CORNER_SEGUNDO_TIEMPO_H", "2"),
          mediasItem(event.cornerParaSegundoTiempoA, "FT_TOTAL_GOLES_DESENLACE_CORNER_SEGUNDO_TIEMPO_A", "2"),

          mediasItem(event.tarjetasAmarillasPartido, "FT_TOTAL_GOLES_DESENLACE_TARJETA_AMARILLA", "3"),
          mediasItem(event.tarjetasAmarillasParaH, "FT_TOTAL_GOLES_DESENLACE_TARJETA_AMARILLA_H", "3"),
          mediasItem(event.tarjetasAmarillasParaA, "FT_TOTAL_GOLES_DESENLACE_TARJETA_AMARILLA_A", "3"),
          mediasItem(event.tarjetasAmarillasParaPrimerTiempo, "FT_TOTAL_GOLES_DESENLACE_TARJETA_AMARILLA_PRIMER_TIEMPO", "3"),
          mediasItem(event.tarjetasAmarillasParaPrimerTiempoH, "FT_TOTAL_GOLES_DESENLACE_TARJETA_AMARILLA_PRIMER_TIEMPO_H", "3"),
          mediasItem(event.tarjetasAmarillasParaPrimerTiempoA, "FT_TOTAL_GOLES_DESENLACE_TARJETA_AMARILLA_PRIMER_TIEMPO_A", "3"),
          mediasItem(event.tarjetasAmarillasParaSegundoTiempo, "FT_TOTAL_GOLES_DESENLACE_TARJETA_AMARILLA_SEGUNDO_TIEMPO", "3"),
          mediasItem(event.tarjetasAmarillasParaSegundoTiempoH, "FT_TOTAL_GOLES_DESENLACE_TARJETA_AMARILLA_SEGUNDO_TIEMPO_H", "3"),
          mediasItem(event.tarjetasAmarillasParaSegundoTiempoA, "FT_TOTAL_GOLES_DESENLACE_TARJETA_AMARILLA_SEGUNDO_TIEMPO_A", "3")
        ]
    );
  }

  Widget mediasItem(OptionsTotalGoles item, betType, type) {
    return (item.available) ? accordionElement(item.title, Icons.update, GolesMedias.get(item, _createBetForm, betType, _onMsg, type)) : Container();
  }

  Widget golesList() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          // "Margen de Victoria"
          (event.footballMargenDeVictoriaDto.available) ?
          accordionElement(
              event.footballMargenDeVictoriaDto.title,
              Icons.map,
              FootBallMargenDeVictoria.get(event, _createBetForm, "FT_MARGEN_DE_VICTORIA", " para margen de victoria")
          ) :
          Container()
          ,

          //  "Goles para el visitante (2do tiempo) (3 desenlaces)"
          (event.footballGolesDto.available) ?
          accordionElement(
              "Goles marcados",
              Icons.check_circle,
              Goles.get(event.footballGolesDto, _createBetForm, "FT_GOLES", "", _onMsg)
          ) :
          Container(),


          (event.primerEnHacer.available) ?
          accordionElement(
              event.primerEnHacer.title,
              Icons.check_circle,
              EquipoEnHacerList.primero(event.primerEnHacer, _createBetForm, _onMsg)
          ) :
          Container(),

          (event.ultimoEnHacer.available) ?
          accordionElement(
              event.ultimoEnHacer.title,
              Icons.check_circle,
              EquipoEnHacerList.ultimo(event.ultimoEnHacer, _createBetForm, _onMsg)
          ) :
          Container()
        ]
    );
  }

  Widget paridadList() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          (event.paridadGolesPartido.available) ?
          accordionElement(
              event.paridadGolesPartido.title,
              Icons.arrow_right,
              Paridad.get(event.paridadGolesPartido, _createBetForm, "FT_PARIDAD_TOTAL_GOLES")
          ) :
          Container(),

          (event.paridadGolesCasa.available) ?
          accordionElement(
              event.paridadGolesCasa.title,
              Icons.arrow_right,
              Paridad.get(event.paridadGolesCasa, _createBetForm, "FT_PARIDAD_TOTAL_GOLES_H")
          ) :
          Container(),

          (event.paridadGolesVisitador.available) ?
          accordionElement(
              event.paridadGolesVisitador.title,
              Icons.arrow_right,
              Paridad.get(event.paridadGolesVisitador, _createBetForm, "FT_PARIDAD_TOTAL_GOLES_A")
          ) :
          Container(),

          (event.paridadGolesPrimerTiempo.available) ?
          accordionElement(
              event.paridadGolesPrimerTiempo.title,
              Icons.arrow_right,
              Paridad.get(event.paridadGolesPrimerTiempo, _createBetForm, "FT_PARIDAD_TOTAL_GOLES_PRIMER_TIEMPO")
          ) :
          Container(),

          (event.paridadGolesSegundoTiempo.available) ?
          accordionElement(
              event.paridadGolesSegundoTiempo.title,
              Icons.label,
              Paridad.get(event.paridadGolesSegundoTiempo, _createBetForm, "FT_PARIDAD_TOTAL_GOLES_SEGUNDO_TIEMPO")
          ) :
          Container(),


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
    if (index == 3) {
      setState(() {
        _selectedTabIndex = 3;
      });
    }
    if (index == 4) {
      setState(() {
        _selectedTabIndex = 4;
      });
    }
  }





}

