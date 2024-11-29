import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/presentation/common/loading_widget.dart';
import 'package:news_app/presentation/screens/search/viewModel/search_view_model.dart';
import 'package:news_app/presentation/screens/search/widgets/search_bar.dart';
import 'package:provider/provider.dart';

import '../../../../base/base_state/base_state.dart';
import '../../../../core/app_assets.dart';
import '../../../../core/app_colors.dart';
import '../../../../data/models/articles_resposne/article.dart';
import '../../../common/error_widget.dart';
import '../../home/tabs/articels/widgets/article_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController controller;
  bool search = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  SearchViewModel viewModel = SearchViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          image: DecorationImage(
            image: AssetImage(
              AppAssets.pattern,
            ),
          ),
        ),
        child: Scaffold(
          body: Column(
            children: [
              Container(
                padding: REdgeInsets.only(
                  left: 34,
                  right: 34,
                  bottom: 9,
                  top: 24,
                ),
                height: 80.h,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50.r),
                  ),
                ),
                child: SearchBarr(
                  controller: controller,
                  onPress: () {
                    search = true;
                    viewModel.search(controller.text);
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              if (search && controller.text.isNotEmpty)
                ChangeNotifierProvider.value(
                  value: viewModel,
                  child: Consumer<SearchViewModel>(
                    builder: (context, viewModel, child) {
                      var state = viewModel.state;
                      switch (state) {
                        case SuccessState():
                          return Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) => ArticleWidget(
                                article: state.data.isNotEmpty
                                    ? state.data[index]
                                    : Article(),
                              ),
                            ),
                          );

                        case ErrorState():
                          return MyErrorWidget(
                            error: state.error,
                            serverError: state.serverError,
                            retryText: 'Retry',
                            onCLick: () {
                              viewModel.search(controller.text);
                            },
                          );
                        case LoadingState():
                          return const LoadingWidget();
                      }
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}