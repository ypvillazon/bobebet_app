import 'package:bobebet_app/models/bet_stats.dart';
import 'package:bobebet_app/services/get_bet_stats_service.dart';
import 'package:bobebet_app/ui/pages/stats/bets/bet_stats/bet_stats_card_widget.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/empty_list.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';

class BetStatsPage extends StatefulWidget {

  BetStatsPage({Key? key}) : super(key: key);

  @override
  _BetStatsPageState createState() => new _BetStatsPageState();
}

class _BetStatsPageState extends State<BetStatsPage> {

  late double _height;
  bool loading = false;

  GetBetStatsService getBetStatsService = GetBetStatsService();
  List<BetStats> betStatsList = [];


  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    setState(() {
      betStatsList = [];
      loading = true;
    });
    getBetStatsService.stats(0,10).then((value) {
      if (value.statusCode == 0) {
        setState(() {
          betStatsList = value.betStatsList ;
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
        if (value.statusCode == 461) {
          MessageWidget.expiredVersion(context);
        } else {
          if (value.statusCode == 99) {
            MessageWidget.expired(context);
          } else {
            MessageWidget.error(context, value.message, 4);
          }
        }
      }
    }) ;
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body:
        (!loading) ?
        Container(
            color: Colors.deepPurple,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 25),
                Buttons.backButton(context, color: Colors.white),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.refresh, size: 30, color: Colors.white),
                          onPressed: ()=>{
                            _init()
                          }
                      )
                    ],
                  )
                ),
                SizedBox(height: _height / 50),
                (betStatsList.length!=0) ?
                Expanded(
                  child: ListView.separated(
                      itemCount: betStatsList.length,
                      padding: const EdgeInsets.all(2.0),
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.transparent,
                      ),
                      itemBuilder: (context, index) {
                        BetStats betStats = betStatsList[index] ;
                        return BetStatsCardWidget(betStats: betStats);
                      }) ,
                ) : EmptyLists.emptyListsMessage(
                        (_height/10),
                        "No existen estadisticas de apuestas porque no tiene usuarios o sus usuarios no han hecho apuestas.",
                        Colors.white
                    )
              ],
            )
        )
            :
        HelperFunctions.loading()
    );
  }
}
