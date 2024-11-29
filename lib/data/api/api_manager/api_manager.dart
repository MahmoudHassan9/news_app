import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/models/articles_resposne/Source.dart';
import 'package:news_app/data/models/articles_resposne/article.dart';
import 'package:news_app/data/models/articles_resposne/articles_response.dart';
import 'package:news_app/data/models/soureces_response/sources_response.dart';
import 'package:news_app/result.dart';

abstract class ApiManager {
  static const String baseURL = 'newsapi.org';
  static const String apiKey = '3d3304580a8749ceab7f836d2a3f8db0';
  static const String sourcesEndPoint = '/v2/top-headlines/sources';
  static const String articlesEndPoint = '/v2/everything';

  static Future<Result<List<Source>>> getSources(String categoryId) async {
    Uri url = Uri.https(
      baseURL,
      sourcesEndPoint,
      {
        'apiKey': apiKey,
        'category': categoryId,
      },
    );
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == 'ok') {
        return Success(
          data: sourcesResponse.sources ?? [],
        );
      } else {
        return ServerError(
          code: sourcesResponse.code ?? '',
          message: sourcesResponse.message ?? '',
        );
      }
    } on Exception catch (e) {
      return Error(
        exception: e,
      );
    }
  }

  static Future<Result<List<Article>>> getArticles(String sourceId) async {
    Uri url = Uri.https(
      baseURL,
      articlesEndPoint,
      {
        'apiKey': apiKey,
        'sources': sourceId,
      },
    );
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == 'ok') {
        return Success(data: articlesResponse.articles ?? []);
      } else {
        return ServerError(
          code: articlesResponse.code ?? '',
          message: articlesResponse.message ?? '',
        );
      }
    } on Exception catch (e) {
      return Error(
        exception: e,
      );
    }
  }

  static Future<Result<List<Article>>> search(String search) async {
    Uri url = Uri.https(
      baseURL,
      articlesEndPoint,
      {
        'apiKey': apiKey,
        'q': search,
      },
    );
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == 'ok') {
        return Success(data: articlesResponse.articles ?? []);
      } else {
        return ServerError(
          code: articlesResponse.code ?? '',
          message: articlesResponse.message ?? '',
        );
      }
    } on Exception catch (e) {
      return Error(
        exception: e,
      );
    }
  }
}
