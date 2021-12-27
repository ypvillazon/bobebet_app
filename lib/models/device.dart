

class DeviceInfoDetails {
  String? versionRelease;
  String? versionCodename;
  String? versionBaseOS;
  String? board;
  String? brand;
  String? device;
  String? display;
  String? fingerprint;
  String? hardware;
  String? host;
  String? id;
  String? manufacturer;
  String? model;
  String? product ;
  String? type;
  bool? isPhysicalDevice;
  String? androidId;
  List<String>? systemFeatures;
}

class DeviceInfoRequest {
  int userId ;
  String email ;
  DeviceInfoDetails deviceInfoDetails ;

  DeviceInfoRequest(this.userId, this.email, this.deviceInfoDetails);
}

