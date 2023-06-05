import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/language_entity.dart';
import '../use_cases/cache_selected_language.dart';

abstract class MyAccountRepository {
  Future<Either<Failure, List<LanguageEntity>>> getLanguages();

  Future<Either<Failure, void>> cacheLanguages(
      CacheSelectedLanguagesParams params);
}
