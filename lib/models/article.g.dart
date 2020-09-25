// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    id: json['id'] as int,
    language: json['language'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'language': instance.language,
      'title': instance.title,
      'content': instance.content,
    };

Articles _$ArticlesFromJson(Map<String, dynamic> json) {
  return Articles(
    collection: (json['collection'] as List)
        ?.map(
            (e) => e == null ? null : Article.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'collection': instance.collection,
    };
