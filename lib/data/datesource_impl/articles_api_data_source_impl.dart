import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/models/articles_resposne/article.dart';
import 'package:news_app/data/date_source_contract/articles_data_source.dart';
import 'package:news_app/result.dart';

class ArticlesApiDataSourceImpl extends ArticlesDataSource {
  ApiManager apiManager;

  ArticlesApiDataSourceImpl({
    required this.apiManager,
  });

  @override
  Future<Result<List<Article>>> getArticles(String sourceId) async {
    return apiManager.getArticles(sourceId);
  }
}
