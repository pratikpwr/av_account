import 'package:flutter/material.dart';

import '../../../../core/atomic/atoms/icon_item.dart';
import '../../../../core/atomic/atoms/padding.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/themes/app_colors.dart';
import '../../domain/entities/language_entity.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  final LanguageEntity language;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            width: 92,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.lightBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? AppColors.orange
                    : AppColors.primaryColor.withOpacity(0.3),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  language.text,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: isSelected ? AppColors.orange : AppColors.primaryColor,
                  ),
                ),
                if (language.text != language.language) ...[
                  padding2,
                  Text(
                    '(${language.language})',
                    style: context.textTheme.bodySmall?.copyWith(
                      color:
                          isSelected ? AppColors.orange : AppColors.primaryColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (isSelected)
          const Positioned(
            right: -5,
            top: -2,
            child: IconItem(
              Assets.tickMark,
              size: 28,
            ),
          ),
      ],
    );
  }
}
