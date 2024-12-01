import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/domain/entity/articles_entity.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_styles.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        image: DecorationImage(
          image: AssetImage(
            AppAssets.pattern,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            article.sourceEntity?.name ?? '',
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: REdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      article.urlToImage ??
                          'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg',
                      height: 232.h,
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
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      article.publishedAt ?? '',
                      style: AppStyles.articleSourceTitle,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: REdgeInsets.symmetric(
                vertical: 16,
                horizontal: 12,
              ),
              padding: REdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Column(
                children: [
                  Text(
                    article.content ?? '',
                    style: AppStyles.articleContent,
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () async {
                          await _launchUrl(article.url);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View Full Article',
                              style: AppStyles.viewFullArticle,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            const Icon(
                              Icons.arrow_right,
                              size: 30,
                              color: AppColors.black,
                            )
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(URL) async {
    final Uri url = Uri.parse(URL);

    await launchUrl(
      url,
    );
  }
}
