import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_styles.dart';
import '../home.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.drawerItem,
    required this.onClick,
  });

  final IconData icon;
  final String text;
  final DrawerItem drawerItem;
  final Function(DrawerItem) onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(drawerItem);
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 30.sp,
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            text,
            style: AppStyles.drawerWidgetTitle,
          )
        ],
      ),
    );
  }
}