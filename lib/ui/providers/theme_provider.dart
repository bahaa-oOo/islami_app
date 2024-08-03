import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  bool get isDarkThemeEnable => currentTheme == ThemeMode.dark;

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isdark");
    if (isDark != null) {
      currentTheme = isDark ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  Future<void> setNewTheme(ThemeMode themeMode) async {
    currentTheme = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isdark', themeMode == ThemeMode.dark);
    notifyListeners();
  }

  Color get primaryColor => isDarkThemeEnable ? AppColors.primaryDark : AppColors.primary;
  String get mainBackground => isDarkThemeEnable ? AppAssets.backgroundDark : AppAssets.background;
}
