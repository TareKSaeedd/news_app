import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16Black,
      labelSmall: AppStyles.medium12Grey,
      labelMedium: AppStyles.medium14Black,
      headlineMedium: AppStyles.medium24Black,
      headlineLarge: AppStyles.medium20Black,
      bodyMedium: AppStyles.medium14White,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    indicatorColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16White,
      labelSmall: AppStyles.medium12Grey,
      labelMedium: AppStyles.medium14White,
      headlineMedium: AppStyles.medium24White,
      headlineLarge: AppStyles.medium20White,
      bodyMedium: AppStyles.medium14Black,
    ),
  );
}
