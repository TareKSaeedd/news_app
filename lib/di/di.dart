import 'package:news_app/api/api_manager.dart';
import 'package:news_app/data/repository/news/data_source/remote/impl/news_remote_data_source_impl.dart';
import 'package:news_app/data/repository/news/data_source/remote/news_remote_data_source.dart';
import 'package:news_app/data/repository/news/repository/impl/news_repository_impl.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';
import 'package:news_app/data/repository/sources/data_source/remote/impl/remote_source_data_source_impl.dart';
import 'package:news_app/data/repository/sources/data_source/remote/remote_source_data_source.dart';
import 'package:news_app/data/repository/sources/repository/impl/source_repository_impl.dart';
import 'package:news_app/data/repository/sources/repository/sources_repository.dart';

// inject source_repository
SourcesRepository injectSourcesRepository() {
  return SourceRepositoryImpl(remoteSourceDataSource: injectRemoteSourceDataSource());
}

// inject remote_source_data_source
RemoteSourceDataSource injectRemoteSourceDataSource() {
  return RemoteSourceDataSourceImpl(apiManager: injectApiManager());
}

// inject apiManage
ApiManager injectApiManager() {
  return ApiManager();
}

//====================================================================================================================

// inject news_repository
NewsRepository injectNewsRepository() {
  return NewsRepositoryImpl(newsRemoteDataSource: injectNewsRemoteDataSource());
}

// inject news_remmote_data_source
NewsRemoteDataSource injectNewsRemoteDataSource() {
  return NewsRemoteDataSourceImpl(apiManager: injectApiManager());
}
