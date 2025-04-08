import 'package:flutter/material.dart';
import 'package:food_delivery_app/theme.dart';
import 'package:food_delivery_app/utils.dart';

class ThemeProvider extends ChangeNotifier{
  void setTheme() async{
    bool isDark=sharedPrefs.prefs.getBool("isDark")??false;
    await sharedPrefs.prefs.setBool("isDark", !isDark);
    notifyListeners();
  }
  ThemeData getTheme(){
    if(sharedPrefs.prefs.getBool("isDark")??false){
      return darkMode;
    }
    return lightMode;
  }
}