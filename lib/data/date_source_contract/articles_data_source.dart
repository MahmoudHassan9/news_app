import 'package:news_app/data/api/models/articles_resposne/article.dart';
import 'package:news_app/result.dart';

abstract class ArticlesDataSource {
  Future<Result<List<Article>>> getArticles(String sourceId);
}
