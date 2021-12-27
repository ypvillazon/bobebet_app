class HourConfiguration {
  late int id ;
  late int hours ;
  late int statsHours ;

  HourConfiguration(this.id, this.hours);

  HourConfiguration.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    hours = map['hours'];
    statsHours = map['statsHours'];
  }
}

class HourConfigurationResponse {
  late int statusCode ;
  late String message ;
  late HourConfiguration hourConfiguration ;
}



