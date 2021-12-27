class EventFilter {
  late String eventId ;
  late String name ;
  late bool selected ;
  late int level ;
  late List<String> parents ;

  EventFilter.fromMap(Map<String, dynamic> map) {
    eventId = map['eventId'];
    name = map['name'];
    selected = map['selected'];
    level = map['level'];
    parents = (map['parents'] as List).map((parent) => parent.toString()).toList() ;
  }
}

class EventFilterResponse {
  late int statusCode ;
  late String message ;
  late List<EventFilter> eventFilters ;
}