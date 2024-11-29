import 'package:flutter/widgets.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/base/base_viewModel/base_view_model.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/models/articles_resposne/Source.dart';
import 'package:news_app/result.dart';

class SourceViewModel extends BaseViewModel<List<Source>> {
  SourceViewModel() : super(state: LoadingState());

  void getSources(String categoryId) async {
    emit(LoadingState());
    var result = await ApiManager.getSources(categoryId);
    switch (result) {
      case Success<List<Source>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<Source>>():
        emit(ErrorState(serverError: result));
      case Error<List<Source>>():
        emit(ErrorState(error: result));
    }
  }
}
