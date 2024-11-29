import 'dart:ui';

import 'package:news_app/core/app_assets.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/app_constants.dart';

class CategoryDM {
  String title;
  String imagePath;
  Color bgColor;
  String id;

  CategoryDM({
    required this.title,
    required this.imagePath,
    required this.bgColor,
    required this.id,
  });

  static List<CategoryDM> getAllCategoris() => [
        CategoryDM(
          title: 'Sports',
          imagePath: AppAssets.ball,
          bgColor: AppColors.red,
          id: AppConstants.sportsId,
        ),
        CategoryDM(
          title: 'Bussines',
          imagePath: AppAssets.bussines,
          bgColor: AppColors.brown,
          id: AppConstants.bussinesId,
        ),
        CategoryDM(
          title: 'Health',
          imagePath: AppAssets.health,
          bgColor: AppColors.bink,
          id: AppConstants.healthId,
        ),
        CategoryDM(
          title: 'Entertainment',
          imagePath: AppAssets.enviroment,
          bgColor: AppColors.blueAccent,
          id: AppConstants.entertainmentId,
        ),
        CategoryDM(
          title: 'Science',
          imagePath: AppAssets.science,
          bgColor: AppColors.yellow,
          id: AppConstants.scienceId,
        ),
      ];
}
