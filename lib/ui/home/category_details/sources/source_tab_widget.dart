import 'package:flutter/material.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/category_details/cubit/source_cubit.dart';
import 'package:news_app/ui/home/category_details/news/news_widget.dart';
import 'package:news_app/ui/home/category_details/sources/source_name.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  final List<Sources> sourcesList;

  const SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  SourceCubit viewModel = SourceCubit(sourcesRepository: injectSourcesRepository());
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: TabController(
            length: widget.sourcesList.length,
            vsync: Scaffold.of(context),
            initialIndex: selectedIndex,
          ),
          isScrollable: true,
          indicatorColor: Theme.of(context).indicatorColor,
          dividerColor: AppColors.transparentColor,
          tabAlignment: TabAlignment.start,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          tabs:
              widget.sourcesList.map((source) {
                return SourceName(
                  source: source,
                  isSelected: selectedIndex == widget.sourcesList.indexOf(source),
                );
              }).toList(),
        ),
        Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex])),
      ],
    );
  }
}
