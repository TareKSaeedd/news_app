import 'package:news_app/data/repository/sources/data_source/remote/remote_source_data_source.dart';
import 'package:news_app/data/repository/sources/repository/sources_repository.dart';
import 'package:news_app/model/source_response.dart';

class SourceRepositoryImpl implements SourcesRepository {
  RemoteSourceDataSource remoteSourceDataSource;

  SourceRepositoryImpl({required this.remoteSourceDataSource});
  @override
  Future<SourceResponse> getSources(String categoryId) {
    return remoteSourceDataSource.getSources(categoryId);
  }
}
