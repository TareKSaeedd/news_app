import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/news/data_source/remote/news_remote_data_source.dart';
import 'package:news_app/model/news_response.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId, String pageNumbers) {
    var response = apiManager.getNewsBySourceId(sourceId, pageNumbers);

    return response;
  }
}
