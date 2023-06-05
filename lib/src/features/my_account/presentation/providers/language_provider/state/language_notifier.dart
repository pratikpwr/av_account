import 'package:av_account/src/core/usecases/usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/language_entity.dart';
import '../../../../domain/use_cases/cache_selected_language.dart';
import '../../../../domain/use_cases/languages_use_case.dart';
import 'language_state.dart';

class LanguageNotifier extends StateNotifier<LanguageState> {
  LanguageNotifier({
    required this.cacheSelectedLanguagesUseCase,
    required this.languagesUseCase,
  }) : super(const LanguageState.initial());

  final CacheSelectedLanguagesUseCase cacheSelectedLanguagesUseCase;
  final LanguagesUseCase languagesUseCase;

  Future<void> allLanguages() async {
    state = state.copyWith(state: LanguageStateStatus.loading);

    final result = await languagesUseCase(NoParams());

    result.fold(
      (failure) => state = state.copyWith(
        state: LanguageStateStatus.failure,
        errorMessage: '',
      ),
      (data) => state = state.copyWith(
        languages: data,
        state: LanguageStateStatus.loaded,
      ),
    );
  }

  Future<void> cacheLanguages() async {
    state = state.copyWith(state: LanguageStateStatus.caching);

    final selectedLanguages =
        state.languages.where((element) => element.isSelected).toList();

    final result = await cacheSelectedLanguagesUseCase(
      CacheSelectedLanguagesParams(selectedLanguages),
    );

    result.fold(
      (failure) => state = state.copyWith(
        state: LanguageStateStatus.failure,
        errorMessage: '',
      ),
      (data) => state = state.copyWith(
        languages: [],
        state: LanguageStateStatus.cached,
      ),
    );
  }

  void languageClicked(LanguageEntity value) {
    final updatedLanguages = <LanguageEntity>[];

    for (var language in state.languages) {
      if (language.code == value.code) {
        updatedLanguages
            .add(language.copyWith(isSelected: !language.isSelected));
      } else {
        updatedLanguages.add(language);
      }
    }
    state = state.copyWith(languages: updatedLanguages);
  }
}
