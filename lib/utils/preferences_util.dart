import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil {
  static String _THEME = "theme";
  static String _NOTIFICATION_TOKEN = "notification_token";

  static Future<SharedPreferences> getInstance() {
    return SharedPreferences.getInstance();
  }

  static Future<SharedPreferences> setTheme(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_THEME, value);
  }

  static Future<String> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_THEME);
  }

  static void setNotificationToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_NOTIFICATION_TOKEN, value);
  }

  static Future<String> getNotificationToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_NOTIFICATION_TOKEN);
  }

}