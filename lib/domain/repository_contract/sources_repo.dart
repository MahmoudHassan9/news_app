import 'package:news_app/domain/entity/sources_entity.dart';

import '../../result.dart';

abstract class SourcesRepo {
  Future<Result<List<SourceEntity>>> getSources(String categoryId);
}
