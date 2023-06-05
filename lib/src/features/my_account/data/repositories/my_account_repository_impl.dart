import 'package:av_account/src/features/my_account/domain/use_cases/cache_custom_interface_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/language_entity.dart';
import '../../domain/repositories/my_acccount_repository.dart';
import '../../domain/use_cases/cache_selected_language.dart';
import '../data_sources/my_account_local_data_source.dart';
import '../data_sources/my_account_remote_data_source.dart';

class MyAccountRepositoryImpl implements MyAccountRepository {
  final MyAccountRemoteDataSource remoteDataSource;
  final MyAccountLocalDataSource localDataSource;

  MyAccountRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, void>> cacheLanguages(
      CacheSelectedLanguagesParams params) async {
    try {
      await localDataSource.cacheLanguages(params.selectedLanguages);
      return const Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<LanguageEntity>>> getLanguages() async {
    try {
      final allLanguages = await remoteDataSource.getLanguages();
      final selectedLanguages = await localDataSource.getCachedLanguages();

      final List<LanguageEntity> updatedLanguages = [];

      for (var language in allLanguages) {
        bool containsLanguage = false;

        for (var selectedLanguage in selectedLanguages) {
          if (language.code == selectedLanguage.code) {
            containsLanguage = true;
            break;
          }
        }

        if (containsLanguage) {
          updatedLanguages.add(language.copyWith(isSelected: true));
        } else {
          updatedLanguages.add(language);
        }
      }

      return Right(updatedLanguages);
    } on CacheException {
      return Left(CacheFailure());
    } on NoDataException {
      return Left(NoDataFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on ParsingException {
      return Left(ParsingFailure());
    }
  }

  @override
  Future<Either<Failure, void>> cacheCustomInterface(
      CacheCustomInterfaceParams params) async {
    try {
      await localDataSource.cacheCustomInterface(params.isCustomInterface);
      return const Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> customInterface() async {
    try {
      final result = await localDataSource.customInterface();
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
