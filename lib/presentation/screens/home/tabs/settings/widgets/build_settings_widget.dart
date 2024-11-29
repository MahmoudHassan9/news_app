import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../providers/settings_tab_provider.dart';

class BuildSettingWidget extends StatelessWidget {
  const BuildSettingWidget({
    super.key,
    required this.text,
    required this.widget,
  });

  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 56,
        right: 37,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        color: Provider.of<SettingsTabProvider>(context).currentTheme ==
                ThemeMode.dark
            ? AppColors.black
            : AppColors.white,
        border: Border.all(
          color: AppColors.green,
          width: 1,
        ),
      ),
      child: ListTile(
        title: Text(
          text,
        ),
        trailing: widget,
      ),
    );
  }
}
