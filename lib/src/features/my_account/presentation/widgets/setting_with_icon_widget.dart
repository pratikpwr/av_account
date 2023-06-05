import 'package:flutter/material.dart';

import '../../../../core/atomic/atoms/icon_item.dart';
import '../../../../core/atomic/atoms/padding.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/themes/app_colors.dart';

class SettingWithIconWidget extends StatelessWidget {
  const SettingWithIconWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.titleColor,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: IconItem(
                  icon,
                  size: 14,
                ),
              ),
              padding12,
              Text(
                title,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: titleColor,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
