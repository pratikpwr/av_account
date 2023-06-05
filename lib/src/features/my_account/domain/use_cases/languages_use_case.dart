import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/language_entity.dart';
import '../repositories/my_acccount_repository.dart';

class LanguagesUseCase implements UseCase<List<LanguageEntity>, NoParams> {
  final MyAccountRepository repository;

  const LanguagesUseCase(this.repository);

  @override
  Future<Either<Failure, List<LanguageEntity>>> call(NoParams params) =>
      repository.getLanguages();
}
