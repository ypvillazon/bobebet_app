import 'package:bobebet_app/models/downlaod_data_event_status_dto.dart';
import 'package:bobebet_app/services/get_download_data_event_status_service.dart';
import 'package:bobebet_app/ui/pages/update_event_data/card_update_event_data_widget.dart';
import 'package:bobebet_app/ui/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:bobebet_app/ui/widgets/common/message.dart';

class UpdateEventDataPage extends StatefulWidget {

  UpdateEventDataPage({Key? key}) : super(key: key);

  @override
  _UpdateEventDataPageState createState() => new _UpdateEventDataPageState();
}

class _UpdateEventDataPageState extends State<UpdateEventDataPage> {

  late double _height;
  late double _width;

  static const _pageSize = 5;
  final PagingController<int, DownlaodDataEventStatusDto> _pagingController = PagingController(firstPageKey: 0);

  final GlobalKey<ScaffoldState> _scaffoldStateKey = new GlobalKey<ScaffoldState>();

  GetDownlaodDataEventStatusDtoService getDownlaodDataEventStatusDtoService = GetDownlaodDataEventStatusDtoService();
  List<DownlaodDataEventStatusDto> downlaodDataEventStatusDtos = [];

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
    getDownlaodDataEventStatusDtoService.downlaodDataEvents(page, _pageSize).then((value) {
      if (value.statusCode == 0) {
        final isLastPage = value.downlaodDataEventStatusDtos.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(value.downlaodDataEventStatusDtos);
        } else {
          final nextPageKey = pageKey + value.downlaodDataEventStatusDtos.length;
          _pagingController.appendPage(value.downlaodDataEventStatusDtos, nextPageKey);
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
                      SizedBox(width: _width / 40),
                      IconButton(
                          icon: Icon(Icons.refresh, size: 30, color: Colors.white),
                          onPressed: ()=>{
                            _pagingController.refresh()
                          }
                      )
                    ],
                  )
                ),
                SizedBox(height: _height / 50),
                    Expanded(child: PagedListView<int, DownlaodDataEventStatusDto>(
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate<DownlaodDataEventStatusDto>(
                          itemBuilder: (context, item, index) =>
                              CardUpdateEventDataWidget(downlaodDataEventStatusDto: item)
                      ),
                     )
                    )
              ],
            )
        )
    );
  }
}
