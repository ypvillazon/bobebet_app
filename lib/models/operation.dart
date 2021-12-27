
class Operation {

  late String fromUserId;
  late String toUserId;
  late String fromUserName;
  late String toUserName;
  late String operation;
  late double credit;
  late String createdAt ;
  late double userFromCreditStart ;
  late double userToCreditStart ;
  late double userToCreditEnd ;

  Operation.fromMap(Map<String, dynamic> map) {
    fromUserId = map['fromUserId'];
    toUserId = map['toUserId'];
    fromUserName = map['fromUserName'];
    toUserName = map['toUserName'];
    operation = map['operation'];
    credit = map['credit'];
    var s = DateTime.parse(map['createdAt']).toLocal() ;
    createdAt = "${s.year}/${s.month}/${s.day} ${s.hour}:${s.minute}:${s.second}" ;
    userFromCreditStart = map['userFromCreditStart'];
    userToCreditStart = map['userToCreditStart'];
    userToCreditEnd = map['userToCreditEnd'];
  }

}

class OperationResponse {
  late int statusCode ;
  late String message ;
  late List<Operation> operations ;

  OperationResponse();
}



