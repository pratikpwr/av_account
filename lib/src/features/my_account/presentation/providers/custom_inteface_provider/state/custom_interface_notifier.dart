import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/usecases/usecase.dart';
import '../../../../domain/use_cases/cache_custom_interface_use_case.dart';
import '../../../../domain/use_cases/custom_interface_use_case.dart';

class CustomInterfaceNotifier extends StateNotifier<bool> {
  CustomInterfaceNotifier(
    this.customInterfaceUseCase,
    this.cacheCustomInterfaceUseCase,
  ) : super(false);

  final CustomInterfaceUseCase customInterfaceUseCase;
  final CacheCustomInterfaceUseCase cacheCustomInterfaceUseCase;

  Future<void> customInterface() async {
    final result = await customInterfaceUseCase(NoParams());

    result.fold(
      (failure) => state = false,
      (data) => state = data,
    );
  }

  Future<void> updateCustomInterface(bool value) async {
    final result =
        await cacheCustomInterfaceUseCase(CacheCustomInterfaceParams(value));

    result.fold(
      (failure) => state = false,
      (data) => state = value,
    );
  }
}
