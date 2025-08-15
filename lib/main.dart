import 'package:flutter/material.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/ui/home/search_screen/search_screen.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appThemeProvider = Provider.of<ThemeProvider>(context);
    var appLanguageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.searchRouteName: (context) => SearchScreen(),
      },

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appThemeProvider.themeMode,
      locale: Locale(appLanguageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
