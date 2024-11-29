import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/base/base_state/base_state.dart';
import 'package:news_app/presentation/common/error_widget.dart';
import 'package:news_app/presentation/common/loading_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/articels/viewModel/article_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../data/api/api_manager/api_manager.dart';
import '../../../../../../data/models/articles_resposne/Source.dart';
import '../../../../../../data/models/articles_resposne/article.dart';
import '../widgets/article_widget.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key, required this.source});

  final Source source;

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  ArticleViewModel viewModel = ArticleViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getArticles(widget.source.id!);
  }

  @override
  void didUpdateWidget(covariant ArticlesView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getArticles(widget.source.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticleViewModel>(
        builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case SuccessState():
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ArticleWidget(
                    article:
                        state.data.isNotEmpty ? state.data[index] : Article(),
                  ),
                ),
              );

            case ErrorState():
              return MyErrorWidget(
                error: state.error,
                serverError: state.serverError,
                retryText: 'Retry',
                onCLick: () {
                  viewModel.getArticles(widget.source.id!);
                },
              );
            case LoadingState():
              return const LoadingWidget();
          }
        },
      ),
    );
  }



}
