import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/app_styles.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: 35,
      ),
      titleTextStyle: AppStyles.appBar,

      centerTitle: true,
      color: AppColors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40.r),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
