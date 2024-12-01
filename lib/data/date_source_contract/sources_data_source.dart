import 'package:news_app/data/api/models/soureces_response/source.dart';

import '../../result.dart';

abstract class SourcesDataSource {
  Future<Result<List<Source>>> getSources(String categoryId);
}
