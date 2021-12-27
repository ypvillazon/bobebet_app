
import 'package:bobebet_app/models/bet_summary_stats_by_user.dart';
import 'package:bobebet_app/services/get_bet_summary_stats_by_user_service.dart';
import 'package:bobebet_app/ui/pages/stats/bets/bet_by_user/bet_summary_stats_by_user_widget.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/empty_list.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';

class BetSummaryStatsByUserPage extends StatefulWidget {

  BetSummaryStatsByUserPage({Key? key}) : super(key: key);

  @override
  _BetSummaryStatsByUserPageState createState() => new _BetSummaryStatsByUserPageState();
}

class _BetSummaryStatsByUserPageState extends State<BetSummaryStatsByUserPage> {

  late double _height;
  bool loading = false;
  GetBetSummaryStatsByUserService getBetSummaryStatsByUserService = GetBetSummaryStatsByUserService();
  List<BetSummaryStatsByUser> betSummaryStatsByUsers = [];

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    setState(() {
      loading = true;
    });
    getBetSummaryStatsByUserService.stats().then((value) {
      if (value.statusCode == 0) {
        setState(() {
          betSummaryStatsByUsers = value.betSummaryStatsByUsers ;
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
    });
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
                        //SizedBox(width: _width / 14)
                      ],
                    )
                ),
                SizedBox(height: _height / 50),
                (betSummaryStatsByUsers.length!=0) ?
                Expanded(
                  child: ListView.separated(
                      itemCount: betSummaryStatsByUsers.length,
                      padding: const EdgeInsets.all(2.0),
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.transparent,
                      ),
                      itemBuilder: (context, index) {
                        BetSummaryStatsByUser betSummaryStatsByUser = betSummaryStatsByUsers[index] ;
                        return BetSummaryStatsByUserWidget(betSummaryStatsByUser: betSummaryStatsByUser);
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
