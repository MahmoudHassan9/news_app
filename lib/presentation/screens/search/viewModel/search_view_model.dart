import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/base/base_viewModel/base_view_model.dart';
import 'package:news_app/domain/entity/articles_entity.dart';
import 'package:news_app/domain/usecases/get_search_use_case.dart';

import '../../../../result.dart';

class SearchViewModel extends BaseViewModel<List<ArticleEntity>> {
  SearchViewModel({required this.useCase}) : super(state: InitialState());

  GetSearchUseCase useCase;

  void search(String sourceId) async {
    emit(LoadingState());
    var result = await useCase.execute(sourceId);
    switch (result) {
      case Success<List<ArticleEntity>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<ArticleEntity>>():
        emit(ErrorState(serverError: result));
      case Error<List<ArticleEntity>>():
        emit(ErrorState(error: result));
    }
  }
}
