import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';

class ThemeProvider extends ChangeNotifier {
  var themeMode = ThemeMode.dark;
  String themeModeText = 'Light';

  void changeAppTheme(BuildContext context) {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      themeModeText = AppLocalizations.of(context)!.dark;
    } else {
      themeMode = ThemeMode.light;
      themeModeText = 'Light';
      themeModeText = AppLocalizations.of(context)!.light;
    }

    notifyListeners();
  }
}
