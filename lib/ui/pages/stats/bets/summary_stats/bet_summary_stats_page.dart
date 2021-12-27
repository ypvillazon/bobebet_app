
import 'package:bobebet_app/models/stats/bet_summary_stats.dart';
import 'package:bobebet_app/services/get_bet_summary_stats_service.dart';
import 'package:bobebet_app/ui/pages/stats/bets/summary_stats/bet_stats_widget.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:bobebet_app/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BetSummaryStatsPage extends StatefulWidget {

  final StatsType statsType;

  BetSummaryStatsPage({Key? key, required this.statsType}) : super(key: key);

  @override
  _BetSummaryStatsPageState createState() => new _BetSummaryStatsPageState();
}

class _BetSummaryStatsPageState extends State<BetSummaryStatsPage> {

  late double _height;
  bool loading = false;

  static const _pageSize = 5;
  final PagingController<int, BetSummaryStats> _pagingController = PagingController(firstPageKey: 0);

  GetBetSummaryStatsService getBetSummaryStatsService = GetBetSummaryStatsService();
  List<BetSummaryStats> betSummaryStats = [];

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
    getBetSummaryStatsService.stats(page, _pageSize, widget.statsType).then((value) {
      if (value.statusCode == 0) {
        final isLastPage = value.betSummaryStats.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(value.betSummaryStats);
        } else {
          final nextPageKey = pageKey + value.betSummaryStats.length;
          _pagingController.appendPage(value.betSummaryStats, nextPageKey);
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
                        //SizedBox(width: _width / 14)
                      ],
                    )
                ),
                SizedBox(height: _height / 50),
                Expanded(child: PagedListView<int, BetSummaryStats>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<BetSummaryStats>(
                      itemBuilder: (context, item, index) => BetStatsWidget(betSummaryStats: item)
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
