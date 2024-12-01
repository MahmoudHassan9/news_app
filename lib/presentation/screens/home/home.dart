import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/app_styles.dart';
import 'package:news_app/lang/locale_keys.g.dart';
import 'package:news_app/presentation/screens/category_details/category_details.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/categories.dart';
import 'package:news_app/presentation/screens/home/tabs/settings/settings.dart';
import 'package:news_app/presentation/screens/home/widgets/home_drawer.dart';
import 'package:news_app/routing/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/app_assets.dart';
import '../../../data/api/models/category_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    selectedWidget = Categories(
      onClick: onCategoryClick,
    );
  }

  late Widget selectedWidget;
  bool isCategoryDetails = false;

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
          appBar: AppBar(
            title: Text(
              LocaleKeys.newsTitle.tr(),
            ),
            actions: [
              if (isCategoryDetails)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.search,
                      );
                    },
                    icon: const ImageIcon(
                      AssetImage(
                        AppAssets.searchIcon,
                      ),
                    ),
                  ),
                )
            ],
          ),
          drawer: HomeDrawer(
            onClick: onClick,
          ),
          body: selectedWidget,
        ),
      ),
    );
  }

  void onCategoryClick(CategoryDM model) {
    selectedWidget = CategoryDetails(
      model: model,
    );
    isCategoryDetails = true;
    setState(() {});
  }

  void onClick(DrawerItem item) {
    Navigator.pop(context);
    if (item == DrawerItem.categories) {
      selectedWidget = Categories(
        onClick: onCategoryClick,
      );
    } else {
      selectedWidget = const Settings();
    }
    isCategoryDetails = false;
    setState(() {});
  }

  void searchBar() {}
}

enum DrawerItem {
  categories,
  settings,
}
