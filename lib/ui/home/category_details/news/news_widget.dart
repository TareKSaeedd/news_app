import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/category_details/news/news_item.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: AppColors.greyColor));
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text('Something went wrong', style: Theme.of(context).textTheme.labelMedium),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.greyColor),
                onPressed: () {
                  ApiManager.getNewsBySourceId(widget.source.id ?? '');
                  setState(() {});
                },
                child: Text('Try Again', style: TextTheme.of(context).labelMedium),
              ),
            ],
          );
        } else if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? '', style: Theme.of(context).textTheme.labelMedium),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.greyColor),
                onPressed: () {
                  ApiManager.getNewsBySourceId(widget.source.id ?? '');
                  setState(() {});
                },
                child: Text('Try Again', style: TextTheme.of(context).labelMedium),
              ),
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}
