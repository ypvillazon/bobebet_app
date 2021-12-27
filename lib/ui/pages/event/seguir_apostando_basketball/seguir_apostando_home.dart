import 'package:bobebet_app/models/bet.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/services/create_bet_service.dart';
import 'package:bobebet_app/services/get_one_event_service.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_basketball/options/basket_cuarto_con_mas_puntos_del_partido.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_basketball/options/basket_margen_de_victoria.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_basketball/options/basket_mitad_con_mas_puntos_del_partido.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_basketball/options/puntos_desenlace.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_basketball/options/resultado_encuentro.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_football/options/ganar_partido_con_handicap.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/material.dart';


class BasketSeguirApostandoHomePage extends StatefulWidget {

  final GlobalKey expansionTileKey = GlobalKey();

  final Event event;
  final dynamic updatedCredit;
  final double credit;

  BasketSeguirApostandoHomePage(
      {Key? key, required this.event, this.updatedCredit, required this.credit})
      : super(key: key);

  @override
  _SeguirApostandoHomePageState createState() => _SeguirApostandoHomePageState();

}

class _SeguirApostandoHomePageState extends State<BasketSeguirApostandoHomePage> {

  CreateBetService createBetService = new CreateBetService();
  TextEditingController creditController = new TextEditingController();
  final FocusNode _betCreditTextFocusNode = FocusNode();
  GetOneEventService _getOneEventService = new GetOneEventService() ;

  int _selectedTabIndex = 0;

  late Event event;
  dynamic updatedCredit;
  late double credit;

  late IconData expand ;

  String creditBet = "0.0";
  String msg = "Actualizando...";
  GlobalKey<FormState> _key = GlobalKey();
  bool loading = false;


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
              child: (_selectedTabIndex == 0) ? this.resultadoList() : (_selectedTabIndex==1) ? this.generalList() : this.totalPuntosList()
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
              title: Text("Resultado", style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_data_setting, color: Colors.white),
              title: Text("Margen", style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.adjust, color: Colors.white),
              title: Text("Medias", style: TextStyle(color: Colors.white))
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
            size: 40,
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
                                  Colors.green
                              )
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


  Widget resultadoList() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          // "Prorroga del partido"
          (event.resultadoPartidoDto.available) ?
          accordionElement(
              event.resultadoPartidoDto.title,
              Icons.update,
              ResultadosEncuentro.get(event, _createBetForm)
          ) :
          Container()
          ,

          (event.ganarPartidoConHandicapDto.available) ?
          accordionElement(
              event.ganarPartidoConHandicapDto.title,
              Icons.system_update_alt,
              GanarPartidoConHandicapElement.get(event.ganarPartidoConHandicapDto, _createBetForm, "BK_GANAR_PARTIDO_HANDICAP",_onMsg)
          ) :
          Container(),

          // FT_GANAR_PARTIDO_HANDICAP
          (event.ganarPartidoConHandicapAsiaticoDto.available) ?
          accordionElement(
              event.ganarPartidoConHandicapAsiaticoDto.title,
              Icons.system_update_alt,
              GanarPartidoConHandicapElement.get1(event.ganarPartidoConHandicapAsiaticoDto, _createBetForm, "BK_GANAR_PARTIDO_HANDICAP_ASIATICO",_onMsg)
          ) :
          Container()

        ]
    );
  }




  Widget generalList() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [

          // "Mitad con mas puntos"
          (event.basketMitadConMasPuntosDto.available) ?
          accordionElement(
              event.basketMitadConMasPuntosDto.title,
              Icons.watch,
              BasketMitadConMasPuntosDelDartido.get(event, _createBetForm, "BK_MITAD_CON_MAS_PUNTOS", "")
          ) :
          Container()
          ,

          // "Cuarto con mas puntos"
          (event.basketCuartoConMasPuntosDto.available) ?
          accordionElement(
              event.basketCuartoConMasPuntosDto.title,
              Icons.access_time,
              BasketCuartoConMasPuntosDelDartido.get(event, _createBetForm, "BK_CUARTO_CON_MAS_PUNTOS", "")
          ) :
          Container()
          ,

          // "Margen de victoria"
          (event.basketMargenDeVictoriaDto.available) ?
          accordionElement(
              event.basketMargenDeVictoriaDto.title,
              Icons.map,
              BasketMargenDeVictoria.get(event, _createBetForm, "BK_MARGEN_DE_VICTORIA", "")
          ) :
          Container()
          ,
        ]
    );
  }

  _onMsg(String v) {
    MessageWidget.info(context, "Las apuestas para ${v} están cerradas, actualice e inténtelo más tarde.", 5);
  }

  Widget totalPuntosList() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          (event.totalPuntosPartido.available) ?
          accordionElement(
              event.totalPuntosPartido.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosPartido, _createBetForm, "BK_DESENLACE_PARTIDO", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosPartidoH.available) ?
          accordionElement(
              event.totalPuntosPartidoH.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosPartidoH, _createBetForm, "BK_DESENLACE_PARTIDO_H", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosPartidoA.available) ?
          accordionElement(
              event.totalPuntosPartidoA.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosPartidoA, _createBetForm, "BK_DESENLACE_PARTIDO_A", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosCuartoConMasPuntos.available) ?
          accordionElement(
              event.totalPuntosCuartoConMasPuntos.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosCuartoConMasPuntos, _createBetForm, "BK_DESENLACE_CUARTO_CON_MAS_PUNTOS", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosCuartoConMenosPuntos.available) ?
          accordionElement(
              event.totalPuntosCuartoConMenosPuntos.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosCuartoConMenosPuntos, _createBetForm, "BK_DESENLACE_CUARTO_CON_MENOS_PUNTOS", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosPrimeraMitad.available) ?
          accordionElement(
              event.totalPuntosPrimeraMitad.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosPrimeraMitad, _createBetForm, "BK_DESENLACE_PRIMERA_MITAD", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosPrimeraMitadH.available) ?
          accordionElement(
              event.totalPuntosPrimeraMitadH.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosPrimeraMitadH, _createBetForm, "BK_DESENLACE_PRIMERA_MITAD_CASA", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosPrimeraMitadA.available) ?
          accordionElement(
              event.totalPuntosPrimeraMitadA.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosPrimeraMitadA, _createBetForm, "BK_DESENLACE_PRIMERA_MITAD_VISITADOR", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosSegundaMitad.available) ?
          accordionElement(
              event.totalPuntosSegundaMitad.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosSegundaMitad, _createBetForm, "BK_DESENLACE_SEGUNDA_MITAD", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosSegundaMitadH.available) ?
          accordionElement(
              event.totalPuntosSegundaMitadH.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosSegundaMitadH, _createBetForm, "BK_DESENLACE_SEGUNDA_MITAD_CASA", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosSegundaMitadA.available) ?
          accordionElement(
              event.totalPuntosSegundaMitadA.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosSegundaMitadA, _createBetForm, "BK_DESENLACE_SEGUNDA_MITAD_VISITADOR", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosC1.available) ?
          accordionElement(
              event.totalPuntosC1.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosC1, _createBetForm, "BK_DESENLACE_CUARTO_1", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosC2.available) ?
          accordionElement(
              event.totalPuntosC2.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosC2, _createBetForm, "BK_DESENLACE_CUARTO_2", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosC3.available) ?
          accordionElement(
              event.totalPuntosC3.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosC3, _createBetForm, "BK_DESENLACE_CUARTO_3", _onMsg)
          ) :
          Container()
          ,

          (event.totalPuntosC4.available) ?
          accordionElement(
              event.totalPuntosC4.title,
              Icons.update,
              PuntosDesenlace.get(event.totalPuntosC4, _createBetForm, "BK_DESENLACE_CUARTO_4", _onMsg)
          ) :
          Container()
          ,

        ]
    );
  }
}

