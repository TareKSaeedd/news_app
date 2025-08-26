import 'package:news_app/model/source_response.dart';

abstract class RemoteSourceDataSource {
  Future<SourceResponse> getSources(String categoryId);
}
