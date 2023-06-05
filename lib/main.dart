import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';
import 'src/core/injector/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const ProviderScope(child: MyApp()));
}
