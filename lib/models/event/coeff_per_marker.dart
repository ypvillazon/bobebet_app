
class CoeffPerMarker {

  final String markerHome ;
  final double coeffHome ;
  final String markerDraw ;
  final double coeffDraw ;
  final String markerAway ;
  final double coeffAway ;


  CoeffPerMarker(this.markerHome, this.coeffHome, this.markerDraw,
      this.coeffDraw, this.markerAway, this.coeffAway);

  CoeffPerMarker.fromMap(Map<String, dynamic> map) :
    markerHome = map['markerHome'],
    coeffHome = map['coeffHome'],
    markerDraw = map['markerDraw'],
    coeffDraw = map['coeffDraw'],
    markerAway = map['markerAway'],
    coeffAway = map['coeffAway'];

}
