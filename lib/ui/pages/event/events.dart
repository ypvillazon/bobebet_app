import 'package:bobebet_app/services/get_games_service.dart';
import 'package:bobebet_app/ui/pages/event/filter_event.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:bobebet_app/models/event/event.dart';
import 'package:bobebet_app/ui/pages/event/card_event.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';

class EventsPage extends StatefulWidget {

  final List<String> namesSelected ;

  EventsPage({Key? key, required this.namesSelected}) : super(key: key);

  @override
  _EventsPageState createState() => new _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {

  late double _height;
  late double _width;

  static const _pageSize = 5;
  final PagingController<int, Event> _pagingController = PagingController(firstPageKey: 0);

  final GlobalKey<ScaffoldState> _scaffoldStateKey = new GlobalKey<ScaffoldState>();

  bool checkBoxValue = false;
  GetGameDataService getGameDataService = GetGameDataService();
  List<Event> events = [];
  //List<String> eventIds = [] ;
  double credit = 0.0 ;

  List<String> namesSelected = [] ;

  @override
  void initState() {
    namesSelected = widget.namesSelected ;
    _init();
    super.initState();
  }

void updatedCredit(v) {
    setState(() {
      credit = credit-v ;
    });
}

  void _init() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  void _fetchPage(int pageKey) {
    int page = (pageKey / _pageSize).floor();
    getGameDataService.gameData(namesSelected, page, _pageSize).then((value) {
      if (value.statusCode == 0) {
        setState(() {
          credit = value.gameData.credit! ;
        });
        final isLastPage = value.gameData.events!.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(value.gameData.events);
        } else {
          final nextPageKey = pageKey + value.gameData.events!.length;
          _pagingController.appendPage(value.gameData.events, nextPageKey);
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
                          icon: Icon(Icons.settings, size: 30, color: Colors.white),
                          onPressed: ()=> {
                            _navigateToFilters(context)
                          }
                      ),
                      SizedBox(width: _width / 40),
                      Container(
                        padding: EdgeInsets.only(right: 10,top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                        child: Text("  \$${double.parse((credit).toStringAsFixed(2))}", style: TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.bold),),
                      ),
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
                    Expanded(child: PagedListView<int, Event>(
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate<Event>(
                          itemBuilder: (context, item, index) =>
                              EventCardWidget(event: item, updatedCredit: updatedCredit, credit: credit)
                      ),
                     )
                    )
              ],
            )
        )
    );
  }

  _navigateToFilters(BuildContext context) async {
    final result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => FilterEventPage()),
    );
    if(result != null && result != "back") {
        setState(() {
          namesSelected = result;
        });
        _pagingController.refresh() ;
    }
  }




}
