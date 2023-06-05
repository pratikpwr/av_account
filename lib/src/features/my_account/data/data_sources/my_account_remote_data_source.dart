import '../../domain/entities/language_entity.dart';
import '../models/language_model.dart';

abstract class MyAccountRemoteDataSource {
  Future<List<LanguageEntity>> getLanguages();
}

class MyAccountRemoteDataSourceImpl implements MyAccountRemoteDataSource {
  @override
  Future<List<LanguageEntity>> getLanguages() async {
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
    return Future.value(languages);
  }
}
