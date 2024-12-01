import 'package:news_app/domain/repository_contract/search_repo.dart';

class GetSearchUseCase {
  SearchRepo repo;

  GetSearchUseCase({required this.repo});

  execute(String search) {
    return repo.search(search);
  }
}
