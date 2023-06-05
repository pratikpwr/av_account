import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/my_acccount_repository.dart';

class CacheCustomInterfaceUseCase
    implements UseCase<void, CacheCustomInterfaceParams> {
  final MyAccountRepository repository;

  const CacheCustomInterfaceUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CacheCustomInterfaceParams params) =>
      repository.cacheCustomInterface(params);
}

class CacheCustomInterfaceParams extends Equatable {
  final bool isCustomInterface;

  const CacheCustomInterfaceParams(this.isCustomInterface);

  @override
  List<Object> get props => [isCustomInterface];
}
