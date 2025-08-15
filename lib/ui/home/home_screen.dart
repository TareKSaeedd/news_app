import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/categeory_fragment/category_fragment.dart';
import 'package:news_app/ui/home/category_details/category_details.dart';
import 'package:news_app/ui/home/drawer_widget.dart';
import 'package:news_app/utils/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategoryModel == null ? 'Home' : selectedCategoryModel!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.searchRouteName);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: DrawerWidget(onDrawerHomeClick: onDrawerHomeClick),
      body:
          selectedCategoryModel == null
              ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
              : CategoryDetails(categoryModel: selectedCategoryModel!),
    );
  }

  void onCategoryItemClick(CategoryModel mewSelectedCategoryModel) {
    selectedCategoryModel = mewSelectedCategoryModel;
    setState(() {});
  }

  void onDrawerHomeClick() {
    selectedCategoryModel = null;
    Navigator.pop(context);
    setState(() {});
  }
}
