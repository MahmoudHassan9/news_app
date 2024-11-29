import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/lang/locale_keys.g.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';
import '../home.dart';
import 'drawer_widget.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.onClick});

  final Function(DrawerItem) onClick;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            color: AppColors.green,
            height: 110.h,
            child: Text(
              LocaleKeys.newsTitle.tr(),
              style: AppStyles.drawerTitle,
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(
              vertical: 18,
              horizontal: 12,
            ),
            child: Column(
              children: [
                DrawerWidget(
                  icon: Icons.list,
                  text:LocaleKeys.categories.tr(),
                  drawerItem: DrawerItem.categories,
                  onClick: onClick,
                ),
                SizedBox(
                  height: 5.h,
                ),
                DrawerWidget(
                  icon: Icons.settings,
                  text: LocaleKeys.settings.tr(),
                  drawerItem: DrawerItem.settings,
                  onClick: onClick,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}