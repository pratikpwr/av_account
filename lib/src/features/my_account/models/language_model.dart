import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable {
  final String language;
  final String code;
  final String text;

  const LanguageModel({
    required this.language,
    required this.code,
    required this.text,
  });

  @override
  List<Object> get props => [language, code, text];
}

const List<LanguageModel> languages = [
  LanguageModel(
    language: 'English',
    code: 'en',
    text: 'English',
  ),
  LanguageModel(
    language: 'Hindi',
    code: 'hi',
    text: 'हिन्दी',
  ),
  LanguageModel(
    language: 'Bangla',
    code: 'bn',
    text: 'বাংলা',
  ),
  LanguageModel(
    language: 'Telugu',
    code: 'te',
    text: 'తెలుగు',
  ),
  LanguageModel(
    language: 'Marathi',
    code: 'mr',
    text: 'मराठी',
  ),
  LanguageModel(
    language: 'Tamil',
    code: 'ta',
    text: 'தமிழ்',
  ),
  LanguageModel(
    language: 'Gujarati',
    code: 'gu',
    text: 'ગુજરાતી',
  ),
  LanguageModel(
    language: 'Malayalam',
    code: 'ml',
    text: 'മലയാളം',
  ),
];
