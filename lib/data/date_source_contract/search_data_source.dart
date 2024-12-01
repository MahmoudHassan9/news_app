import 'package:news_app/data/api/models/articles_resposne/article.dart';

import '../../result.dart';

abstract class SearchDataSource {
  Future<Result<List<Article>>> search(String search);
}
