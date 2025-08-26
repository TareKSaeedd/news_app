import 'dart:convert';

import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';

class ApiManager {
  Future<SourceResponse> getSources(String categoryId) async {
    // https://newsapi.org/v2/top-headlines/sources?apiKey=b5e58c9b906345cbbbd44b1a997d1e6c

    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
    });

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);

      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  Future<NewsResponse> getNewsBySourceId(String sourceId, String pageNumbers) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=b5e58c9b906345cbbbd44b1a997d1e6c
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
      'page': pageNumbers,
      'pageSize': '5',
    });
    try {
      var response = await http.get(url);

      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> getNewsBySearch(String searchByUser) async {
    //https://newsapi.org/v2/everything?q=searchIn&apiKey=b5e58c9b906345cbbbd44b1a997d1e6c
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'q': searchByUser,
      'searchIn': 'title',
    });
    try {
      var response = await http.get(url);

      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
