import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;

  static Init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setTheme({required String key, required dynamic value}) async {
    sharedPreferences!.setBool(key, value);
  }

  static bool? getThem({required String key}) {
    return sharedPreferences!.getBool(key);
  }
}
