import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

typedef SearchText = void Function(String text);

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key, required this.searchTextFunction});
  SearchText searchTextFunction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (searchText) {
        searchTextFunction(searchText);
      },
      style: Theme.of(context).textTheme.headlineLarge,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.whiteColor),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.whiteColor),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.headlineLarge,
        labelStyle: Theme.of(context).textTheme.headlineLarge,
        prefixIcon: Icon(Icons.search, color: AppColors.whiteColor),
        suffixIcon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
