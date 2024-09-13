import 'package:shared_preferences/shared_preferences.dart';

import '../utils.dart';

class Prefs {
  static int coins = 100;
  static int gems = 100;

  static String coinsKEY = 'coinsKEY';
  static String gemsKEY = 'gemsKEY';
}

Future<void> getData() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove(Prefs.onboard);
    // await prefs.clear();
    Prefs.coins = prefs.getInt(Prefs.coinsKEY) ?? 100;
    Prefs.gems = prefs.getInt(Prefs.gemsKEY) ?? 5;
  } catch (e) {
    logger(e);
  }
}

Future<void> saveString(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<void> saveInt(String key, int value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

Future<void> saveBool(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}
