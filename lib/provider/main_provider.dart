import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{
  ThemeMode currentThemeMode = ThemeMode.dark;

  void changeTheme(ThemeMode themeMode){
    currentThemeMode = themeMode;
    notifyListeners();
  }
}