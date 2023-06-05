import '../../domain/entities/language_entity.dart';

class LanguageModel extends LanguageEntity {
  const LanguageModel({
    required super.language,
    required super.code,
    required super.text,
    super.isSelected = false,
  });

  factory LanguageModel.fromEntity(LanguageEntity entity) {
    return LanguageModel(
      language: entity.language,
      code: entity.code,
      text: entity.text,
      isSelected: entity.isSelected,
    );
  }

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      language: json['language'],
      code: json['code'],
      text: json['text'],
      isSelected: json['is_selected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'code': code,
      'text': text,
      'is_selected': isSelected,
    };
  }
}
