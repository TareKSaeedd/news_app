import 'package:news_app/model/source_response.dart';

abstract class SourcesRepository {
  Future<SourceResponse> getSources(String categoryId);
}
