import 'package:bobebet_app/models/operation.dart';
import 'package:bobebet_app/services/get_balance_service.dart';
import 'package:bobebet_app/ui/pages/balance/operation_card.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';

class BalancePage extends StatefulWidget {

  String userSessionId ;

  BalancePage({Key? key, required this.userSessionId}) : super(key: key);

  @override
  _BalancePageState createState() => new _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {

  late double _height;

  static const _pageSize = 5;
  final PagingController<int, Operation> _pagingController = PagingController(firstPageKey: 0);

  final GlobalKey<ScaffoldState> _scaffoldStateKey = new GlobalKey<ScaffoldState>();

  GetBalanceService getBalanceService = GetBalanceService();
  List<Operation> operations = [];

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
    getBalanceService.operations(page, _pageSize).then((value) {
      if (value.statusCode == 0) {
        final isLastPage = value.operations.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(value.operations);
        } else {
          final nextPageKey = pageKey + value.operations.length;
          _pagingController.appendPage(value.operations, nextPageKey);
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
                Expanded(child: PagedListView<int, Operation>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Operation>(
                      itemBuilder: (context, item, index) =>
                          OperationCardWidget(operation: item, userSessionId: widget.userSessionId,)
                  ),
                )
                )
              ],
            )
        )
    );
  }
}
