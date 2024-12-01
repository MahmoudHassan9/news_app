import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../../../data/api/models/category_model.dart';
import '../home/tabs/sources/view/sources_view.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.model});

  final CategoryDM model;

  @override
  Widget build(BuildContext context) {
    return SourcesView(
      model: model,
    );
  }
}
