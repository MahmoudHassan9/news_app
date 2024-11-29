import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/app_styles.dart';
import 'package:news_app/lang/locale_keys.g.dart';
import 'package:news_app/presentation/screens/home/tabs/settings/widgets/build_settings_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/settings_tab_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsTabProvider settingsTabProvider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 25,
            bottom: 17,
            left: 38,
            right: 38,
          ),
          child: Text(
            LocaleKeys.language.tr(),
            style: Provider.of<SettingsTabProvider>(context).currentTheme ==
                    ThemeMode.light
                ? AppStyles.settingsTabLabel
                : AppStyles.settingsTabLabel.copyWith(
                    color: Colors.white,
                  ),
          ),
        ),
        BuildSettingWidget(
          text: settingsTabProvider.lang,
          widget: buildDropdownButton(
            context: context,
            settingsTabProvider: settingsTabProvider,
            title1: 'English',
            title2: 'العربية',
            val1: 'en',
            val2: 'ar',
          ),
        ),
      ],
    );
  }

  DropdownButton<String> buildDropdownButton({
    required BuildContext context,
    required SettingsTabProvider settingsTabProvider,
    required String val1,
    required String title1,
    required String val2,
    required String title2,
  }) {
    return DropdownButton<String>(
      underline: Container(),
      iconEnabledColor: AppColors.green,
      borderRadius: BorderRadius.circular(16),
      dropdownColor: AppColors.green,
      value: val1 == 'en'
          ? settingsTabProvider.languageCode
          : settingsTabProvider.isLight
              ? 'light'
              : 'dark',
      items: [
        DropdownMenuItem(
          value: val1,
          child: Text(
            title1,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        DropdownMenuItem(
          value: val2,
          child: Text(
            title2,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
      onChanged: (value) async {
        // print(value);
        if (value == 'light' || value == 'dark') {
          settingsTabProvider.changeTheme(value);
        } else {
          settingsTabProvider.changeLanguage(value, context);
          await context.setLocale(Locale(
            value ?? settingsTabProvider.languageCode,
          ));
        }
      },
    );
  }
}
