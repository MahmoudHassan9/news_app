// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "newsTitle": "الأخبار",
  "language": "اللغة",
  "categories": "الأقسام",
  "settings": "الإعدادات",
  "pickYouCategory": "اختر القسم الذي يعجبك "
};
static const Map<String,dynamic> en = {
  "newsTitle": "News app",
  "language": "Language",
  "categories": "Categories",
  "settings": "Settings",
  "pickYouCategory": "Pick your category \n of interest"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
