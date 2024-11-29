import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/app_colors.dart';

abstract class AppStyles {
  static TextStyle appBar = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w900,
    color: AppColors.white,
  );
  static TextStyle drawerTitle = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle drawerWidgetTitle = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
  static TextStyle categoryBodyTitle = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.gray,
  );
  static TextStyle categoryTitle = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static TextStyle sourceTabTitle = GoogleFonts.exo(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static TextStyle articleSourceTitle = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF79828B),
  );
  static TextStyle articleTitle = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF42505C),
  );
  static TextStyle articleContent = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: const Color(0xFF42505C),
  );
  static TextStyle viewFullArticle = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF42505C),
  );
  static TextStyle hint = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.green,
  );

  static TextStyle settingsTabLabel = GoogleFonts.poppins(
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
}
