import 'package:bobebet_app/models/event/coeff_per_marker.dart';

class CoeffPerMarkerByEvent {

  final List<CoeffPerMarker> markers ;

  CoeffPerMarkerByEvent(this.markers);

  CoeffPerMarkerByEvent.fromMap(Map<String, dynamic> map) :
    markers = (map['markers'] != null) ? (map['markers'] as List).map((markers) => CoeffPerMarker.fromMap(markers)).toList() : [];





}

