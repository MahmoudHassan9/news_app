import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/routing/app_routes.dart';

import '../../../../../../core/app_styles.dart';
import '../../../../../../data/api/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});

  final CategoryDM model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            model.imagePath,
            width: 132.w,
            height: 116.h,
          ),
          Text(
            model.title,
            style: AppStyles.categoryTitle,
          )
        ],
      ),
    );
  }
}
