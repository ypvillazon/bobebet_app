
class CoeffPerMarker {

  late String markerHome ;
  late double coeffHome ;
  late String markerDraw ;
  late double coeffDraw ;
  late String markerAway ;
  late double coeffAway ;


  CoeffPerMarker(this.markerHome, this.coeffHome, this.markerDraw,
      this.coeffDraw, this.markerAway, this.coeffAway);

  CoeffPerMarker.fromMap(Map<String, dynamic> map) {
    print("JI");
    markerHome = map['markerHome'];
    coeffHome = map['coeffHome'];
    markerDraw = map['markerDraw'];
    coeffDraw = map['coeffDraw'];
    markerAway = map['markerAway'];
    coeffAway = map['coeffAway'];
    }

}
