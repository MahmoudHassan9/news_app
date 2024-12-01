import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/models/soureces_response/source.dart';
import 'package:news_app/data/date_source_contract/sources_data_source.dart';
import 'package:news_app/result.dart';

class SourcesApiDataSourceImpl extends SourcesDataSource {
  ApiManager apiManager;

  SourcesApiDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Source>>> getSources(String categoryId) async {
    return apiManager.getSources(categoryId);
  }
}
