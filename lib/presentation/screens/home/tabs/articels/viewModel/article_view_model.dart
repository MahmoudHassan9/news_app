import 'package:flutter/widgets.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/base/base_viewModel/base_view_model.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/domain/entity/articles_entity.dart';
import 'package:news_app/domain/usecases/get_articles_use_case.dart';

import 'package:news_app/result.dart';

import '../../../../../../data/api/models/articles_resposne/article.dart';
import '../../../../../../domain/repository_contract/articles_repo.dart';

class ArticleViewModel extends BaseViewModel<List<ArticleEntity>> {
  ArticleViewModel({required this.useCase}) : super(state: LoadingState());

  GetArticlesUseCase useCase;

  void getArticles(String sourceId) async {
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
