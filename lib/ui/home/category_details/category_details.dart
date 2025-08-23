import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/category_details/cubit/source_cubit.dart';
import 'package:news_app/ui/home/category_details/cubit/source_state.dart';
import 'package:news_app/ui/home/category_details/sources/source_tab_widget.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceCubit viewModel = SourceCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.categoryModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceCubit, SourceState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceErrorState) {
          return Column(
            children: [
              Text(state.errorMessage, style: Theme.of(context).textTheme.labelMedium),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.greyColor),
                onPressed: () {
                  viewModel.getSources(widget.categoryModel.id);
                },
                child: Text('Try Again', style: TextTheme.of(context).labelMedium),
              ),
            ],
          );
        } else if (state is SourceSuccessState) {
          return SourceTabWidget(sourcesList: state.sourcesList);
        } else {
          return Center(child: CircularProgressIndicator(color: AppColors.greyColor));
        }
      },
    );

    // FutureBuilder<SourceResponse>(
    //   future: ApiManager.getSources(widget.categoryModel.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator(color: AppColors.greyColor));
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text('Something went wrong', style: Theme.of(context).textTheme.labelMedium),
    //           ElevatedButton(
    //             style: ElevatedButton.styleFrom(backgroundColor: AppColors.greyColor),
    //             onPressed: () {
    //               setState(() {
    //                 ApiManager.getSources(widget.categoryModel.id);
    //               });
    //             },
    //             child: Text('Try Again', style: TextTheme.of(context).labelMedium),
    //           ),
    //         ],
    //       );
    //     } else if (snapshot.data?.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data!.message!, style: Theme.of(context).textTheme.labelMedium),
    //           ElevatedButton(
    //             style: ElevatedButton.styleFrom(backgroundColor: AppColors.greyColor),
    //             onPressed: () {
    //               setState(() {
    //                 ApiManager.getSources(widget.categoryModel.id);
    //               });
    //             },
    //             child: Text('Try Again', style: TextTheme.of(context).labelMedium),
    //           ),
    //         ],
    //       );
    //     }
    //     var sourcesList = snapshot.data?.sources ?? [];
    //     return SourceTabWidget(sourcesList: sourcesList);
    //   },
    // );
  }
}
