import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  Article(
      {this.id,
      this.language,
      this.title,
      this.content});

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  int id;
  String language;
  String title;
  String content;

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class Articles {
  Articles({
    this.collection,
  });

  factory Articles.fromJson(Map<String, dynamic> json) => _$ArticlesFromJson(json);

  List<Article> collection;
}
