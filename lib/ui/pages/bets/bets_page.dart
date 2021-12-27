import 'package:bobebet_app/models/bet.dart';
import 'package:bobebet_app/services/get_bets_service.dart';
import 'package:bobebet_app/ui/pages/bets/bets_card.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';

class BetsPage extends StatefulWidget {

  BetsPage({Key? key}) : super(key: key);

  @override
  _BetsPageState createState() => new _BetsPageState();
}

class _BetsPageState extends State<BetsPage> {

  late double _height;
  late double _width;

  static const _pageSize = 5;
  final PagingController<int, Bets> _pagingController = PagingController(firstPageKey: 0);

  final GlobalKey<ScaffoldState> _scaffoldStateKey = new GlobalKey<ScaffoldState>();

  GetBetsService getBetsService = GetBetsService();
  List<Event> bets = [];

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
    getBetsService.bets(page, _pageSize).then((value) {
      if (value.statusCode == 0) {
        final isLastPage = value.bets.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(value.bets);
        } else {
          final nextPageKey = pageKey + value.bets.length;
          _pagingController.appendPage(value.bets, nextPageKey);
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
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldStateKey,
        body: Container(
            color: Colors.deepPurple,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: _height / 30),
                Buttons.backButton(context, color: Colors.white),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.refresh, size: 30, color: Colors.white),
                          onPressed: ()=>{
                            _pagingController.refresh()
                          }
                      )
                      //SizedBox(width: _width / 14)
                    ],
                  )
                ),
                SizedBox(height: _height / 50),
                Expanded(child: PagedListView<int, Bets>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Bets>(
                      itemBuilder: (context, item, index) =>
                          BetsCardWidget(bets: item)
                  ),
                )
                )
              ],
            )
        )
    );
  }
}
