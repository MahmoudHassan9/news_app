import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/base/base_viewModel/base_view_model.dart';
import 'package:news_app/domain/entity/sources_entity.dart';
import 'package:news_app/domain/usecases/get_sources_use_case.dart';
import 'package:news_app/result.dart';

class SourceViewModel extends BaseViewModel<List<SourceEntity>> {
  SourceViewModel({required this.useCase}) : super(state: LoadingState());
  GetSourcesUseCase useCase;

  void getSources(String categoryId) async {
    emit(LoadingState());
    var result = await useCase.execute(categoryId);
    switch (result) {
      case Success<List<SourceEntity>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<SourceEntity>>():
        emit(ErrorState(serverError: result));
      case Error<List<SourceEntity>>():
        emit(ErrorState(error: result));
    }
    // switch (result) {
    //   case Success<List<Source>>():
    //     emit(SuccessState(data: result.data));
    //   case ServerError<List<Source>>():
    //     emit(ErrorState(serverError: result));
    //   case Error<List<Source>>():
    //     emit(ErrorState(error: result));
    // }
  }
}
