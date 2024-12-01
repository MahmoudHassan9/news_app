import 'package:news_app/domain/entity/sources_entity.dart';

class ArticleEntity {
  final String? urlToImage;
  final String? publishedAt;
  final String? title;
  final SourceEntity? sourceEntity;
  final String? content;
  final String? url;

  const ArticleEntity({
    this.sourceEntity,
    this.urlToImage,
    this.content,
    this.publishedAt,
    this.title,
    this.url,
  });
}
