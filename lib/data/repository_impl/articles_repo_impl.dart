import 'package:news_app/data/api/models/articles_resposne/article.dart';
import 'package:news_app/data/date_source_contract/articles_data_source.dart';
import 'package:news_app/domain/entity/articles_entity.dart';
import 'package:news_app/result.dart';

import '../../domain/repository_contract/articles_repo.dart';

class ArticlesRepoImpl extends ArticlesRepo {
  ArticlesDataSource articlesDataSource;

  ArticlesRepoImpl({
    required this.articlesDataSource,
  });

  @override
  Future<Result<List<ArticleEntity>>> getArticles(String sourceId) async {
    var result = await articlesDataSource.getArticles(sourceId);
    switch (result) {
      case Success<List<Article>>():
        var articleEntityList =
            result.data.map((article) => article.toArticleEntity()).toList();
        return Success(data: articleEntityList);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }
}
