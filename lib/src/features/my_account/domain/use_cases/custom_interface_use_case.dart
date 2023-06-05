import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/my_acccount_repository.dart';

class CustomInterfaceUseCase implements UseCase<bool, NoParams> {
  final MyAccountRepository repository;

  const CustomInterfaceUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) =>
      repository.customInterface();
}
