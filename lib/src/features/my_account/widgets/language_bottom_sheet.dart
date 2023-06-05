import 'package:flutter/material.dart';

import '../../../core/atomic/atoms/padding.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/themes/app_colors.dart';
import '../models/language_model.dart';
import 'language_button.dart';

void languageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: AppColors.backgroundColor,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 3,
              width: 20,
              decoration: BoxDecoration(
                color: AppColors.buttonTextColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            padding24,
            Text(
              'Edit Language',
              style: context.textTheme.titleLarge
                  ?.copyWith(color: AppColors.textColor.withOpacity(1)),
            ),
            padding10,
            Text(
              'Select the languages VoicePods to be in',
              style: context.textTheme.bodyMedium,
            ),
            padding28,
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return LanguageButton(
                    language: languages[index],
                    isSelected: true,
                    onTap: () {},
                  );
                },
              ),
            ),
            padding28,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Update',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: AppColors.buttonTextColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Cancel',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: AppColors.textButtonTextColor,
                    ),
                  ),
                ),
              ],
            ),
            padding24,
          ],
        ),
      );
    },
  );
}
