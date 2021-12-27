class Session {
  String? sessionId;
  String? userId;
  String? role ;

  Session({this.sessionId, this.userId, this.role});

  Session.fromMap(Map<String, dynamic> map) {
    sessionId = map['sessionId'];
    userId = map['userId'];
    role = map['role'];
  }
}

class SessionResponse {
  late int statusCode ;
  late String message ;
  late Session session ;
}
