import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';

class SearchBarr extends StatelessWidget {
  const SearchBarr(
      {super.key, required this.controller, this.onChange});

  final TextEditingController controller;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      style: const TextStyle(
        color: AppColors.green,
      ),
      controller: controller,
      minLines: 1,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: AppColors.green,
          ),
        ),
        suffixIcon: Padding(
          padding: REdgeInsets.all(10.0),
          child: const ImageIcon(
            AssetImage(
              AppAssets.searchIcon,
            ),
            color: AppColors.green,
          ),
        ),
        hintText: 'Search Article',
        hintStyle: AppStyles.hint,
        filled: true,
        fillColor: AppColors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
