import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/presentation/common/loading_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../../base/base_state/base_state.dart';
import '../../../../../common/error_widget.dart';
import '../../../../category_details/widgets/sources_tab.dart';
import '../viewModel/source_view_model.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key, required this.model});

  final CategoryDM model;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  SourceViewModel viewModel = SourceViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.model.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<SourceViewModel>(
        builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case SuccessState():
              return SourcesTab(sources: state.data);
            case ErrorState():
              return MyErrorWidget(
                error: state.error,
                serverError: state.serverError,
                retryText: 'Retry',
                onCLick: () {
                  viewModel.getSources(widget.model.id);
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
