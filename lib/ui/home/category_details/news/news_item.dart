import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    DateTime paresedTime = DateTime.parse(news.publishedAt ?? '');
    String formattedNewsTime = timeago.format(paresedTime);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).indicatorColor, width: 1),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: height * .01),
          Text(news.title ?? '', style: Theme.of(context).textTheme.labelLarge),
          SizedBox(height: height * .01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text('By : ${news.author}', style: Theme.of(context).textTheme.labelSmall),
              ),
              Text(formattedNewsTime, style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
