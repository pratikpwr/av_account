import 'dart:convert';

import 'package:av_account/src/core/preferences/local_preferences.dart';
import 'package:av_account/src/core/preferences/preference_keys.dart';

import '../../domain/entities/language_entity.dart';
import '../models/language_model.dart';

abstract class MyAccountLocalDataSource {
  Future<void> cacheLanguages(List<LanguageEntity> languages);

  Future<List<LanguageEntity>> getCachedLanguages();
}

class MyAccountLocalDataSourceImpl implements MyAccountLocalDataSource {
  final LocalPreferences prefs;

  MyAccountLocalDataSourceImpl(this.prefs);

  @override
  Future<void> cacheLanguages(List<LanguageEntity> languages) async {
    await prefs.init();
    await prefs.set(
        PreferenceKey.languages,
        languages
            .map((item) => jsonEncode(LanguageModel.fromEntity(item).toJson()))
            .toList());
  }

  @override
  Future<List<LanguageEntity>> getCachedLanguages() async {
    await prefs.init();
    final languages = prefs.get<List<dynamic>>(PreferenceKey.languages);

    if (languages != null) {
      final selectedLanguage = <LanguageModel>[];
      for (final language in languages) {
        selectedLanguage.add(LanguageModel.fromJson(jsonDecode(language)));
      }

      return selectedLanguage;
    } else {
      return [];
    }
  }
}
