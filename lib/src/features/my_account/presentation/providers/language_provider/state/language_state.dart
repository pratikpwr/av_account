import 'package:equatable/equatable.dart';

import '../../../../domain/entities/language_entity.dart';

enum LanguageStateStatus {
  initial,
  loading,
  loaded,
  caching,
  cached,
  failure,
}

class LanguageState extends Equatable {
  final LanguageStateStatus state;
  final List<LanguageEntity> languages;
  final String errorMessage;
  // final bool isLoading;

  const LanguageState({
    this.state = LanguageStateStatus.initial,
    this.languages = const [],
    this.errorMessage = '',
    // this.isLoading = false,
  });

  const LanguageState.initial({
    this.state = LanguageStateStatus.initial,
    this.languages = const [],
    this.errorMessage = '',
    // this.isLoading = false,
  });

  LanguageState copyWith({
    LanguageStateStatus? state,
    List<LanguageEntity>? languages,
    String? errorMessage,
    // bool? isLoading,
  }) {
    return LanguageState(
      state: state ?? this.state,
      languages: languages ?? this.languages,
      errorMessage: errorMessage ?? this.errorMessage,
      // isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        state,
        languages,
        errorMessage,
        // isLoading,
      ];
}
