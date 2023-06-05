import 'package:av_account/src/core/themes/app_colors.dart';
import 'package:av_account/src/core/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      fontFamily: 'Acumin-Pro',
      scaffoldBackgroundColor: AppColors.backgroundColor,
      brightness: Brightness.dark,
      textTheme: textTheme.apply(bodyColor: AppColors.textColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: const Size(130, 44),
        ),
      )
      // useMaterial3: true,
      );
}
