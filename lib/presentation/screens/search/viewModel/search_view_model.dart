import 'package:flutter/widgets.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/base/base_viewModel/base_view_model.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/models/articles_resposne/Source.dart';
import 'package:news_app/data/models/articles_resposne/article.dart';
import 'package:news_app/result.dart';

class SearchViewModel extends BaseViewModel<List<Article>> {
  SearchViewModel() : super(state: InitialState());

  void search(String sourceId) async {
    emit(LoadingState());
    var result = await ApiManager.search(sourceId);
    switch (result) {
      case Success<List<Article>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<Article>>():
        emit(ErrorState(serverError: result));
      case Error<List<Article>>():
        emit(ErrorState(error: result));
    }
  }
}
