import 'dart:ui';
import 'package:bobebet_app/models/downlaod_data_event_status_dto.dart';
import 'package:bobebet_app/services/get_one_download_data_event_service.dart';
import 'package:bobebet_app/services/update_and_get_one_download_data_event_service.dart';
import 'package:bobebet_app/ui/pages/update_event_data/update_event_data_widget_functions.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardUpdateEventDataWidget extends StatefulWidget {
  final DownlaodDataEventStatusDto downlaodDataEventStatusDto;

  CardUpdateEventDataWidget({Key? key, required this.downlaodDataEventStatusDto}) : super(key: key);

  @override
  _CardUpdateEventDataWidgetState createState() => new _CardUpdateEventDataWidgetState();
}

class _CardUpdateEventDataWidgetState extends State<CardUpdateEventDataWidget> {

  GetOneDownloadDataService getOneDownloadDataService = new GetOneDownloadDataService() ;
  UpdateAndGetOneDownloadDataService updateAndGetOneDownloadDataService = new UpdateAndGetOneDownloadDataService() ;

  late DownlaodDataEventStatusDto downlaodDataEventStatusDto ;

  String msg = "Actualizando..." ;

  GlobalKey<FormState> _key = GlobalKey();

  bool loading = false ;
  bool error = false;
  late double _height;
  late double _width;

  @override
  void initState() {
    downlaodDataEventStatusDto = widget.downlaodDataEventStatusDto ;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateDataEvent() {
    setState(() {
      msg="Actualizando datos ..." ;
      loading=true;
    });
    updateAndGetOneDownloadDataService.update(downlaodDataEventStatusDto.eventId).then((value) {
      if (value.statusCode == 0) {
        setState(() {
          loading = false ;
          downlaodDataEventStatusDto = value.downlaodDataEventStatusDto ;
        });
        MessageWidget.info(context, "Ejecución de actualzación de datos del evento con exito. Verifique si sus datos fueron actualizado.", 3);
      } else {
        setState(() { loading = false ; });
        MessageWidget.error(context, value.message, 4);
      }
    });
  }

  void _refreshDataEvent() {
    setState(() {
      msg="Resfrescando datos ..." ;
      loading=true;
    });
    getOneDownloadDataService.get(downlaodDataEventStatusDto.eventId).then((value) {
      if (value.statusCode == 0) {
        setState(() {
          error=false;
          downlaodDataEventStatusDto = value.downlaodDataEventStatusDto ;
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

  @override
  Widget build(BuildContext context) {
    DownlaodDataEventStatusDto e = downlaodDataEventStatusDto ;
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
                    UpdateEventDataWidgetFunctions.navigatorCardBar(_width, e, _refreshDataEvent),
                    ListTile(
                      leading: _sportImage(e.sport),
                      title: Text("${e.game}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                      subtitle: Text("${e.event}", style: TextStyle(fontSize: 12),),
                    ),
                    (downlaodDataEventStatusDto.sport == "Football") ?
                      UpdateEventDataWidgetFunctions.detailsFootball(_width, downlaodDataEventStatusDto) :
                      Container(),
                    (downlaodDataEventStatusDto.sport == "Basketball") ?
                      UpdateEventDataWidgetFunctions.detailsBasketball(_width, downlaodDataEventStatusDto) :
                      Container(),
                    SizedBox(height: 15),
                    SizedBox(height: 2, child: Container(color: Colors.grey.shade300)),
                    SizedBox(height: 5),
                    UpdateEventDataWidgetFunctions.updates(_width, downlaodDataEventStatusDto),
                    UpdateEventDataWidgetFunctions.footerCardBar(_width,_updateDataEvent),
                  ]
                )
              )
            ])


    );
  }

  Widget _sportImage(String s) {
    String sport = "football.png" ;
    if(s == "Basketball") {
      sport = "basketball.png" ;
    }
    if(s == "Baseball") {
      sport = "baseball.png" ;
    }
    if(s == "Tennis") {
      sport = "tennis.png" ;
    }
    if(s == "Boxing") {
      sport = "boxing.png" ;
    }
    return new Image.asset(
      'assets/images/' + sport,
      width: 40,
      height: 40,
    ) ;
  }

}

