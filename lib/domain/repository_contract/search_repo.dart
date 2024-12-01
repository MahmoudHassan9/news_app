import 'package:news_app/domain/entity/articles_entity.dart';

import '../../result.dart';

abstract class SearchRepo {
  Future<Result<List<ArticleEntity>>> search(String search);
}
