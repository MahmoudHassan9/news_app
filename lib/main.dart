import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/settings_tab_provider.dart';
import 'package:provider/provider.dart';

import 'lang/codegen_loader.g.dart';
import 'my_app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsTabProvider()..saveLanguage(),
      child: EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
      ),
    ),
  );
}
