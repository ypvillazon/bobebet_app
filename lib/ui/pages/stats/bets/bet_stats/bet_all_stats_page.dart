import 'package:bobebet_app/models/bet_stats.dart';
import 'package:bobebet_app/services/get_bet_stats_service.dart';
import 'package:bobebet_app/ui/pages/stats/bets/bet_stats/bet_stats_card_widget.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/ui/widgets/common/empty_list.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BetAllStatsPage extends StatefulWidget {

  BetAllStatsPage({Key? key}) : super(key: key);

  @override
  _BetAllStatsPageState createState() => new _BetAllStatsPageState();
}

class _BetAllStatsPageState extends State<BetAllStatsPage> {

  late double _height;
  bool loading = false;

  static const _pageSize = 5;
  final PagingController<int, BetStats> _pagingController = PagingController(firstPageKey: 0);

  GetBetStatsService getBetStatsService = GetBetStatsService();
  List<BetStats> betStatsList = [];


  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  void _fetchPage(int pageKey) {
    int page = (pageKey / _pageSize).floor();
    getBetStatsService.stats(page, _pageSize).then((value) {
      if (value.statusCode == 0) {
        final isLastPage = value.betStatsList.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(value.betStatsList);
        } else {
          final nextPageKey = pageKey + value.betStatsList.length;
          _pagingController.appendPage(value.betStatsList, nextPageKey);
        }
      } else {
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
    }).catchError((error) {
      _pagingController.error = error;
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
                              this._pagingController.refresh()
                            }
                        )
                      ],
                    )
                ),
                SizedBox(height: _height / 50),
                Expanded(child: PagedListView<int, BetStats>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<BetStats>(
                      itemBuilder: (context, item, index) => BetStatsCardWidget(betStats: item)
                  ),
                )
                )
              ],
            )
        )
            :
        HelperFunctions.loading()
    );
  }
}
