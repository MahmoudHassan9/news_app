import 'package:news_app/domain/repository_contract/articles_repo.dart';

class GetArticlesUseCase {
  ArticlesRepo repo;

  GetArticlesUseCase({required this.repo});

  execute(String sourceId) {
    return repo.getArticles(sourceId);
  }
}
