import 'package:bobebet_app/preference/preferences_helper.dart';


class Prefs {

  // GETs
  static Future<String> get sessionId => PreferencesHelper.getString("sessionId");

  static Future<String> get sessionUserId => PreferencesHelper.getString("sessionUserId");

  static Future<String> get role => PreferencesHelper.getString("role");

  static Future<String> get namesSelected => PreferencesHelper.getString("namesSelected");

  static Future<String> get pin => PreferencesHelper.getString("pin");

  static Future<bool> get pinSave => PreferencesHelper.getBool("pinSave");


  // SETs
  static Future<void> setSessionId(v) => PreferencesHelper.setString("sessionId", v);

  static void setSessionUserId(v) => PreferencesHelper.setString("sessionUserId", v);

  static void setRole(v) => PreferencesHelper.setString("role", v);

  static void setPin(v) => PreferencesHelper.setString("pin", v);

  static void setPinSave(v) => PreferencesHelper.setBool("pinSave", v);

  static void setNamesSelected(v) => PreferencesHelper.setString("namesSelected", v);

}
