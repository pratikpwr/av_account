import 'package:flutter/material.dart';

import 'core/themes/app_theme.dart';
import 'features/my_account/presentation/screens/my_account_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AV Account APP',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const MyAccountScreen(),
    );
  }
}
