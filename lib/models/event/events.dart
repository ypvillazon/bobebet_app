import 'package:bobebet_app/models/event/event.dart';

class Events {
  late List<Event>? events ;
  late double? credit ;
}

class GameDataResponse {
  late int statusCode ;
  late String message ;
  late Events gameData ;
}

