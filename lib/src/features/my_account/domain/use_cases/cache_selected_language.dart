import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/language_entity.dart';
import '../repositories/my_acccount_repository.dart';

class CacheSelectedLanguagesUseCase
    implements UseCase<void, CacheSelectedLanguagesParams> {
  final MyAccountRepository repository;

  const CacheSelectedLanguagesUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CacheSelectedLanguagesParams params) =>
      repository.cacheLanguages(params);
}

class CacheSelectedLanguagesParams extends Equatable {
  final List<LanguageEntity> selectedLanguages;

  const CacheSelectedLanguagesParams(this.selectedLanguages);

  @override
  List<Object> get props => [selectedLanguages];
}
