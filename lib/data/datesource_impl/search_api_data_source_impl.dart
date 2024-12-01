import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/models/articles_resposne/article.dart';
import 'package:news_app/data/date_source_contract/search_data_source.dart';
import 'package:news_app/domain/entity/articles_entity.dart';
import 'package:news_app/result.dart';

class SearchApiDataSourceImpl extends SearchDataSource {
  ApiManager apiManager;

  SearchApiDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Article>>> search(String search) {
    return apiManager.search(search);
  }
}
