import 'package:bobebet_app/models/bet.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/services/create_bet_service.dart';
import 'package:bobebet_app/services/get_one_event_service.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_fa/options/fa_cuarto_con_mas_puntos_del_partido.dart';
import 'package:bobebet_app/ui/pages/event/seguir_apostando_fa/options/puntos_desenlace.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/ui/widgets/fields/fields.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/material.dart';


class FASeguirApostandoHomePage extends StatefulWidget {

  final GlobalKey expansionTileKey = GlobalKey();

  final Event event;
  final dynamic updatedCredit;
  final double credit;

  FASeguirApostandoHomePage(
      {Key? key, required this.event, this.updatedCredit, required this.credit})
      : super(key: key);

  @override
  _FASeguirApostandoHomePageState createState() => _FASeguirApostandoHomePageState();

}

class _FASeguirApostandoHomePageState extends State<FASeguirApostandoHomePage> {

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
              child: (_selectedTabIndex == 0) ? this.generalList() : this.puntosList()
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
              title: Text("Cuartos", style: TextStyle(color: Colors.white))
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
            if (value) {
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
    return new Image.asset(
      'assets/images/fa.png',
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
  }


  Widget generalList() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [

          // "Cuarto con mas puntos"
          (event.faCuartoConMasPuntosDto.available) ?
          accordionElement(
              event.faCuartoConMasPuntosDto.title,
              Icons.access_time,
              FACuartoConMasPuntosDelDartido.get(event, _createBetForm, "FA_CUARTO_CON_MAS_PUNTOS", "")
          ) :
          Container(),
        ]
    );
  }

  _onMsg(String v) {
    MessageWidget.info(context, "Las apuestas para ${v} están cerradas, actualice e inténtelo más tarde.", 5);
  }

  Widget puntosList() {
    return ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          (event.faOptionsPuntosDtoPartido.available) ?
          accordionElement(
              event.faOptionsPuntosDtoPartido.title,
              Icons.update,
              PuntosDesenlace.get(event.faOptionsPuntosDtoPartido, _createBetForm, "FA_DESENLACE_PARTIDO", _onMsg)
          ) :
          Container()
          ,

          (event.faOptionsPuntosDtoPartidoH.available) ?
          accordionElement(
              event.faOptionsPuntosDtoPartidoH.title,
              Icons.update,
              PuntosDesenlace.get(event.faOptionsPuntosDtoPartidoH, _createBetForm, "FA_DESENLACE_PARTIDO_H", _onMsg)
          ) :
          Container()
          ,

          (event.faOptionsPuntosDtoPartidoA.available) ?
          accordionElement(
              event.faOptionsPuntosDtoPartidoA.title,
              Icons.update,
              PuntosDesenlace.get(event.faOptionsPuntosDtoPartidoA, _createBetForm, "FA_DESENLACE_PARTIDO_A", _onMsg)
          ) :
          Container()
          ,

          (event.faOptionsPuntosDtoPrimeraMitad.available) ?
          accordionElement(
              event.faOptionsPuntosDtoPrimeraMitad.title,
              Icons.update,
              PuntosDesenlace.get(event.faOptionsPuntosDtoPrimeraMitad, _createBetForm, "FA_DESENLACE_PRIMERA_MITAD", _onMsg)
          ) :
          Container()
          ,

          (event.faOptionsPuntosDtoPuntosC1.available) ?
          accordionElement(
              event.faOptionsPuntosDtoPuntosC1.title,
              Icons.update,
              PuntosDesenlace.get(event.faOptionsPuntosDtoPuntosC1, _createBetForm, "FA_DESENLACE_CUARTO_1", _onMsg)
          ) :
          Container()
          ,
        ]
    );
  }
}

