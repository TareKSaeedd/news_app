import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/ui/home/category_details/news/news_item.dart';
import 'package:news_app/ui/home/category_details/news/web_page_view.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late final PagingController<int, News> _pagingController;

  @override
  void initState() {
    ApiManager apiManager = ApiManager();
    super.initState();

    _pagingController = PagingController<int, News>(
      getNextPageKey: (state) {
        return state.lastPageIsEmpty ? null : state.nextIntPageKey;
      },
      fetchPage: (pageKey) async {
        await Future.delayed(const Duration(seconds: 2));
        try {
          final newsResponse = await apiManager.getNewsBySourceId(
            widget.source.id ?? '',
            pageKey.toString(),
          );
          return newsResponse.articles ?? [];
        } on Exception catch (e) {
          throw e;
        }
      },
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      child: PagingListener(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) {
          return PagedListView<int, News>(
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: AppColors.transparentColor,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.04,
                            right: width * 0.04,
                            bottom: height * 0.02,
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                              right: width * 0.02,
                              left: width * 0.02,
                              top: height * 0.01,
                            ),
                            height: height * 0.5,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: item.urlToImage ?? '',
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    height: height * 0.25,
                                  ),
                                ),
                                SizedBox(height: height * 0.01),
                                Text(
                                  item.content ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 5,
                                  overflow: TextOverflow.clip,
                                ),
                                SizedBox(height: height * 0.01),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => WebPageView(url: item.url ?? ''),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context).primaryColor,
                                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'View Full Articel',
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: NewsItem(news: item),
                );
              },
            ),
          );
        },
      ),
      onRefresh: () async => _pagingController.refresh(),
    );
  }
}
    /*

    FutureBuilder(
      future: ApiManager.getNewsBySourceId(widget.source.id ?? '', '2'),
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
                  ApiManager.getNewsBySourceId(widget.source.id ?? '', '2');
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
                  ApiManager.getNewsBySourceId(widget.source.id ?? '', '2');
                  setState(() {});
                },
                child: Text('Try Again', style: TextTheme.of(context).labelMedium),
              ),
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return PagingListener(
          controller: _pagingController,
          builder: (context, state, fetchNextPage) {
            return PagedListView(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: AppColors.transparentColor,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.04,
                              right: width * 0.04,
                              bottom: height * 0.02,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                right: width * 0.02,
                                left: width * 0.02,
                                top: height * 0.01,
                              ),
                              height: height * 0.5,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: newsList[index].urlToImage ?? '',
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                      fit: BoxFit.cover,
                                      height: height * 0.25,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    newsList[index].content ?? '',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    maxLines: 5,
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(height: height * 0.01),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) => WebPageView(url: newsList[index].url ?? ''),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context).primaryColor,
                                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      'View Full Articel',
                                      style: Theme.of(context).textTheme.labelLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: NewsItem(news: newsList[index]),
                  );
                },
              ),
            );
          },
        );
      },
    );

    */

