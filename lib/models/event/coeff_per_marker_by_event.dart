import 'dart:convert';

import 'package:bobebet_app/models/event/coeff_per_marker.dart';

class CoeffPerMarkerByEvent {

  late List<CoeffPerMarker> markers ;

  CoeffPerMarkerByEvent(this.markers);

  CoeffPerMarkerByEvent.fromMap(Map<String, dynamic> map) {
    if (map != null) {
      var markersList = map["markers"] as List;
      markers = markersList.map((tagJson) => CoeffPerMarker.fromMap(tagJson)).toList();
    } else {
      markers = [];
    }
  }

}

