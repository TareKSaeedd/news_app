import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var themeMode = ThemeMode.light;
  String themeModeText = 'Light';

  void changeAppTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      themeModeText = 'Dark';
    } else {
      themeMode = ThemeMode.light;
      themeModeText = 'Light';
    }

    notifyListeners();
  }
}
