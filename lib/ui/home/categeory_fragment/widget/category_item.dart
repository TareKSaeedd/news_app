import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  List<CategoryModel> categoryList;
  int index;
  CategoryItem({super.key, required this.categoryList, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image(image: AssetImage(categoryList[index].image)),
        ),
        Positioned(
          right: isEven() ? width * 0.04 : width * 0.45,
          bottom: height * 0.018,
          child: Container(
            padding:
                isEven()
                    ? EdgeInsets.only(left: width * 0.04)
                    : EdgeInsets.only(right: width * 0.04),
            height: height * 0.06,
            width: width * 0.43,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(84),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: isEven() ? TextDirection.ltr : TextDirection.rtl,
              children: [
                Text('View All', style: Theme.of(context).textTheme.headlineMedium),
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 25,
                  child: Icon(
                    isEven() ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool isEven() {
    if (index % 2 == 0) {
      return true;
    } else {
      return false;
    }
  }
}
