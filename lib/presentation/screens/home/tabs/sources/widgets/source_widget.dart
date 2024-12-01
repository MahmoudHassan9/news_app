import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/domain/entity/sources_entity.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../core/app_styles.dart';

class SourceWidget extends StatelessWidget {
  const SourceWidget({super.key, required this.source, required this.isSelected});

  final SourceEntity source;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(
        vertical: 16,
        horizontal: 10,
      ),
      padding: REdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.green : AppColors.white,
        border: Border.all(
          color: AppColors.green,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Text(
        source.name ?? '',
        style: isSelected
            ? AppStyles.sourceTabTitle
            : AppStyles.sourceTabTitle.copyWith(
          color: AppColors.green,
        ),
      ),
    );
  }
}
