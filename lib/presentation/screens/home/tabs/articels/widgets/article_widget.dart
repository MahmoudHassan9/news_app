import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/domain/entity/articles_entity.dart';
import 'package:news_app/presentation/common/loading_widget.dart';
import 'package:news_app/routing/app_routes.dart';

import '../../../../../../core/app_styles.dart';
import '../../../../../../data/api/models/articles_resposne/article.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.articleDetails,
          arguments: article,
        );
      },
      child: Container(
        padding: REdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                height: 235.h,
                imageUrl: article.urlToImage ??
                    'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg',
                placeholder: (context, url) => const LoadingWidget(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              article.sourceEntity?.name ?? '',
              style: AppStyles.articleSourceTitle,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              article.title ?? '',
              style: AppStyles.articleTitle,
            )
          ],
        ),
      ),
    );
  }
}
