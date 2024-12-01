import 'package:news_app/domain/repository_contract/sources_repo.dart';

class GetSourcesUseCase {
  SourcesRepo repo;

  GetSourcesUseCase({required this.repo});

  execute(String categoryId) {
    return repo.getSources(categoryId);
  }
}
