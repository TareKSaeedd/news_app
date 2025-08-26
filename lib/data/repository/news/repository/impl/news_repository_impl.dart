import 'package:news_app/data/repository/news/data_source/remote/news_remote_data_source.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';
import 'package:news_app/model/news_response.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId, String pageNumbers) {
    return newsRemoteDataSource.getNewsBySourceId(sourceId, pageNumbers);
  }
}
