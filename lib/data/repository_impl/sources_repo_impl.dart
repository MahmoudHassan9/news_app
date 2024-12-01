import 'package:news_app/data/api/models/soureces_response/source.dart';

import '../../domain/entity/sources_entity.dart';
import '../../domain/repository_contract/sources_repo.dart';
import '../../result.dart';
import '../date_source_contract/sources_data_source.dart';

class SourcesRepoImpl extends SourcesRepo {
  SourcesDataSource sourcesDataSource;

  SourcesRepoImpl({required this.sourcesDataSource});

  @override
  Future<Result<List<SourceEntity>>> getSources(String categoryId) async {
    var result = await sourcesDataSource.getSources(categoryId);
    switch (result) {
      case Success<List<Source>>():
        var sourceEntityList =
            result.data.map((source) => source.toSourceEntity()).toList();
        return Success(data: sourceEntityList);
      case ServerError<List<Source>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Source>>():
        return Error(exception: result.exception);
    }
  }
}
