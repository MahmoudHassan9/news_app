import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/app_styles.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/lang/locale_keys.g.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/widgets/category_item.dart';

class Categories extends StatefulWidget {
  const Categories({super.key, required this.onClick});

  final Function(CategoryDM) onClick;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategoryDM> catogries = CategoryDM.getAllCategoris();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
        vertical: 30,
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.pickYouCategory.tr(),
            style: AppStyles.categoryBodyTitle,
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 25,
                  childAspectRatio: 0.85),
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    25.r,
                  ),
                  topRight: Radius.circular(
                    25.r,
                  ),
                  bottomRight: Radius.circular(
                    index.isOdd ? 25.r : 0.r,
                  ),
                  bottomLeft: Radius.circular(
                    index.isEven ? 25.r : 0.r,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    widget.onClick(catogries[index]);
                  },
                  child: CategoryItem(
                    model: catogries[index],
                  ),
                ),
              ),
              itemCount: catogries.length,
            ),
          )
        ],
      ),
    );
  }
}
