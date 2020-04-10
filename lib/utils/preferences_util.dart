import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil {

  static String THEME = "theme";

  static String NOTIFICATION_TOKEN = "notification_token";

  static Future<SharedPreferences> setTheme(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(THEME, value);
  }

  static Future<String> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(THEME);
  }

  static void setNotificationToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(NOTIFICATION_TOKEN, value);
  }

  static Future<String> getNotificationToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(NOTIFICATION_TOKEN);
  }

}