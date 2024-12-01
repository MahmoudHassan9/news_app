import 'package:news_app/domain/entity/articles_entity.dart';

import '../../result.dart';

abstract class ArticlesRepo {
  Future<Result<List<ArticleEntity>>> getArticles(String sourceId);
}
