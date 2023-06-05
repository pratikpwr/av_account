import 'package:av_account/src/features/my_account/domain/use_cases/cache_selected_language.dart';
import 'package:av_account/src/features/my_account/domain/use_cases/languages_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../features/my_account/data/data_sources/my_account_local_data_source.dart';
import '../../features/my_account/data/data_sources/my_account_remote_data_source.dart';
import '../../features/my_account/data/repositories/my_account_repository_impl.dart';
import '../../features/my_account/domain/repositories/my_acccount_repository.dart';
import '../preferences/local_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => CacheSelectedLanguagesUseCase(sl()));
  sl.registerLazySingleton(() => LanguagesUseCase(sl()));

  sl.registerLazySingleton<MyAccountRepository>(
    () => MyAccountRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<MyAccountRemoteDataSource>(
    () => MyAccountRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<MyAccountLocalDataSource>(
    () => MyAccountLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton(() => LocalPreferences());
}
