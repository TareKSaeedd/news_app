import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/sources/data_source/remote/remote_source_data_source.dart';
import 'package:news_app/model/source_response.dart';

class RemoteSourceDataSourceImpl implements RemoteSourceDataSource {
  ApiManager apiManager;

  RemoteSourceDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse> getSources(String categoryId) {
    var response = apiManager.getSources(categoryId);

    return response;
  }
}
