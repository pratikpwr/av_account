import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../extensions/context_extensions.dart';
import '../../themes/app_colors.dart';

AppBar appBarItem(
  BuildContext context, {
  required String title,
  IconData? leadingIcon,
  VoidCallback? leadingOnTap,
}) {
  return AppBar(
    title: Text(
      title,
      style: context.textTheme.titleSmall?.copyWith(color: AppColors.white),
    ),
    leading: leadingIcon != null
        ? InkWell(
            onTap: leadingOnTap,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(leadingIcon),
            ),
          )
        : null,
    leadingWidth: 32,
    elevation: 0,
    backgroundColor: AppColors.lightBackgroundColor,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.lightBackgroundColor,
    ),
  );
}
