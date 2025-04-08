import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences prefs;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}

final sharedPrefs =SharedPrefs();