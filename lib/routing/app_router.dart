import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/article_details/article_details.dart';
import 'package:news_app/routing/app_routes.dart';

import '../data/models/articles_resposne/article.dart';
import '../presentation/screens/home/home.dart';
import '../presentation/screens/search/view/search_view.dart';

abstract class AppRouter {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case AppRoutes.search:
        return MaterialPageRoute(
          builder: (_) => const SearchView(),
        );
      case AppRoutes.articleDetails:
        return MaterialPageRoute(builder: (_) {
          final article = settings.arguments as Article;
          return ArticleDetails(
            article: article,
          );
        });
    }
    return null;
  }
}
