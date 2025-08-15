import 'package:flutter/material.dart';
import 'package:news_app/utils/app_assets.dart';

class CategoryModel {
  String id;
  String title;
  String image;

  CategoryModel({required this.id, required this.title, required this.image});

  static List<CategoryModel> getCategoriesList(ThemeMode themeMode) {
    return [
      CategoryModel(
        id: 'general',
        title: 'General',
        image:
            themeMode == ThemeMode.light ? AppAssets.generalDarkImage : AppAssets.generalLightImage,
      ),
      CategoryModel(
        id: 'business',
        title: 'Business',
        image:
            themeMode == ThemeMode.light
                ? AppAssets.businessDarkImage
                : AppAssets.businessLightImage,
      ),
      CategoryModel(
        id: 'sports',
        title: 'Sports',
        image:
            themeMode == ThemeMode.light ? AppAssets.sportsDarkImage : AppAssets.sportsLightImage,
      ),
      CategoryModel(
        id: 'technology',
        title: 'Technology',
        image:
            themeMode == ThemeMode.light
                ? AppAssets.technologyDarkImage
                : AppAssets.technologyLightImage,
      ),
      CategoryModel(
        id: 'health',
        title: 'Health',
        image:
            themeMode == ThemeMode.light ? AppAssets.healthDarkImage : AppAssets.healthLightImage,
      ),
      CategoryModel(
        id: 'entertainment',
        title: 'Entertainment',
        image:
            themeMode == ThemeMode.light
                ? AppAssets.entertainmentDarkImage
                : AppAssets.entertainmentLightImage,
      ),
      CategoryModel(
        id: 'science',
        title: 'Science',
        image:
            themeMode == ThemeMode.light ? AppAssets.scienceDarkImage : AppAssets.scienceLightImage,
      ),
    ];
  }
}
