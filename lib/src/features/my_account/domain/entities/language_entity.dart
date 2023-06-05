import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  final String language;
  final String code;
  final String text;
  final bool isSelected;

  const LanguageEntity({
    required this.language,
    required this.code,
    required this.text,
    required this.isSelected,
  });

  @override
  List<Object> get props => [
        language,
        code,
        text,
        isSelected,
      ];

  LanguageEntity copyWith({
    bool? isSelected,
  }) {
    return LanguageEntity(
      language: language,
      code: code,
      text: text,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
