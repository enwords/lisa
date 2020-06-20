// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) {
  return Word(
    id: json['id'] as int,
    language: json['language'] as String,
    value: json['value'] as String,
    pos: json['pos'] as String,
    weight: json['weight'] as int,
    transcription: json['transcription'] as String,
  );
}

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'id': instance.id,
      'language': instance.language,
      'value': instance.value,
      'pos': instance.pos,
      'weight': instance.weight,
      'transcription': instance.transcription,
    };

Words _$WordsFromJson(Map<String, dynamic> json) {
  return Words(
    collection: (json['collection'] as List)
        ?.map(
            (e) => e == null ? null : Word.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WordsToJson(Words instance) => <String, dynamic>{
      'collection': instance.collection,
    };
