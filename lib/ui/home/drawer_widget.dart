import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

typedef OnDrawerHomeClick = void Function();

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.onDrawerHomeClick});
  final OnDrawerHomeClick onDrawerHomeClick;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var appThemeProvider = Provider.of<ThemeProvider>(context);
    var appLanguageProvider = Provider.of<LanguageProvider>(context);

    return Drawer(
      child: Column(
        // padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            child: Center(
              child: Text(AppLocalizations.of(context)!.news_app, style: AppStyles.bold24Black),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.018),
              color: AppColors.blackColor,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      onDrawerHomeClick();
                    },
                    child: Row(
                      children: [
                        Image.asset(AppAssets.iconHome),
                        SizedBox(width: width * 0.02),
                        Text(
                          AppLocalizations.of(context)!.go_to_home,
                          style: AppStyles.bold20White,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.028),
                  Divider(color: AppColors.whiteColor),
                  SizedBox(height: height * 0.028),
                  Row(
                    children: [
                      Image.asset(AppAssets.iconTheme),
                      SizedBox(width: width * 0.02),
                      Text(AppLocalizations.of(context)!.theme, style: AppStyles.bold20White),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  InkWell(
                    onTap: () {
                      appThemeProvider.changeAppTheme(context);
                    },
                    child: ThemeAndLangContainer(
                      containerText:
                          appThemeProvider.themeMode == ThemeMode.light
                              ? AppLocalizations.of(context)!.light
                              : AppLocalizations.of(context)!.dark,
                    ),
                  ),
                  SizedBox(height: height * 0.028),
                  Divider(color: AppColors.whiteColor),
                  SizedBox(height: height * 0.028),
                  Row(
                    children: [
                      Image.asset(AppAssets.iconLanguage),
                      SizedBox(width: width * 0.02),
                      Text(AppLocalizations.of(context)!.language, style: AppStyles.bold20White),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  InkWell(
                    onTap: () => appLanguageProvider.changeAppLanguage(),
                    child: ThemeAndLangContainer(
                      containerText:
                          appLanguageProvider.appLanguage == 'en'
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThemeAndLangContainer extends StatelessWidget {
  ThemeAndLangContainer({super.key, required this.containerText});
  String containerText;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.018, horizontal: width * 0.04),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.whiteColor, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(containerText, style: AppStyles.medium20White),
          Icon(Icons.arrow_drop_down, color: AppColors.whiteColor),
        ],
      ),
    );
  }
}
