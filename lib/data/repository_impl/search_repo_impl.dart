import 'package:news_app/data/api/models/articles_resposne/article.dart';
import 'package:news_app/data/date_source_contract/search_data_source.dart';
import 'package:news_app/domain/entity/articles_entity.dart';
import 'package:news_app/domain/repository_contract/search_repo.dart';
import 'package:news_app/result.dart';

class SearchRepoImpl extends SearchRepo {
  SearchDataSource searchDataSource;

  SearchRepoImpl({required this.searchDataSource});

  @override
  Future<Result<List<ArticleEntity>>> search(String search) async {
    var result = await searchDataSource.search(search);
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
