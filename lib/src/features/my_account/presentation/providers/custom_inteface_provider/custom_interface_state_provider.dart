import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/injector/injection_container.dart';
import 'state/custom_interface_notifier.dart';

final customInterfaceNotifierProvider =
    StateNotifierProvider<CustomInterfaceNotifier, bool>(
  (ref) {
    return CustomInterfaceNotifier(sl(), sl())..customInterface();
  },
);
