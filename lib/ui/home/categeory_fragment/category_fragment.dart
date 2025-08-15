import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/ui/home/categeory_fragment/widget/category_item.dart';
import 'package:provider/provider.dart';

typedef OnCategoryItemClick = void Function(CategoryModel categoryModel);

class CategoryFragment extends StatelessWidget {
  const CategoryFragment({super.key, required this.onCategoryItemClick});
  final OnCategoryItemClick onCategoryItemClick;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var appThemeProvider = Provider.of<ThemeProvider>(context);
    List<CategoryModel> categoryList = CategoryModel.getCategoriesList(appThemeProvider.themeMode);
    return Padding(
      padding: EdgeInsets.only(left: width * 0.038, right: width * 0.038, top: height * 0.018),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: height * 0.018),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryItemClick(categoryList[index]);
                  },
                  child: CategoryItem(categoryList: categoryList, index: index),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: height * 0.018),
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
