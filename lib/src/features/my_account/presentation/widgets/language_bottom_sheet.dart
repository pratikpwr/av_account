import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/atomic/atoms/padding.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/themes/app_colors.dart';
import '../providers/language_provider/language_state_provider.dart';
import '../providers/language_provider/state/language_state.dart';
import 'language_button.dart';

void languageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const LanguageBottomSheet();
    },
  );
}

class LanguageBottomSheet extends ConsumerWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(languageNotifierProvider);

    ref.listen(
      languageNotifierProvider,
      (LanguageState? previous, LanguageState next) {
        if (next.state == LanguageStateStatus.cached) {
          Navigator.pop(context);
        }
      },
    );

    return state.languages.isNotEmpty
        ? Container(
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.8,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 20,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.languages.length,
                    itemBuilder: (context, index) {
                      return LanguageButton(
                        language: state.languages[index],
                        isSelected: state.languages[index].isSelected,
                        onTap: () => ref
                            .read(languageNotifierProvider.notifier)
                            .languageClicked(state.languages[index]),
                      );
                    },
                  ),
                ),
                padding28,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => ref
                          .read(languageNotifierProvider.notifier)
                          .cacheLanguages(),
                      child: state.state == LanguageStateStatus.caching
                          ? const CircularProgressIndicator()
                          : Text(
                              'Update',
                              style: context.textTheme.labelLarge?.copyWith(
                                color: AppColors.buttonTextColor,
                              ),
                            ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
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
          )
        : const SizedBox.shrink();
  }
}
