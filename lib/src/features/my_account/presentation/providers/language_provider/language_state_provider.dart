import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/injector/injection_container.dart';
import 'state/language_notifier.dart';
import 'state/language_state.dart';

final languageNotifierProvider =
    StateNotifierProvider<LanguageNotifier, LanguageState>(
  (ref) {
    return LanguageNotifier(
      cacheSelectedLanguagesUseCase: sl(),
      languagesUseCase: sl(),
    )..allLanguages();
  },
);
