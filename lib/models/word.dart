import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable()
class Word {
  Word(
      {this.id,
      this.language,
      this.value,
      this.transcription});

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  int id;
  String language;
  String value;
  String transcription;

  Map<String, dynamic> toJson() => _$WordToJson(this);
}

@JsonSerializable()
class Words {
  Words({
    this.collection,
  });

  factory Words.fromJson(Map<String, dynamic> json) => _$WordsFromJson(json);

  List<Word> collection;
}
