import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/atomic/atoms/padding.dart';
import '../../../../core/atomic/molecules/app_bar_item.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/themes/app_colors.dart';
import '../providers/custom_inteface_provider/custom_interface_state_provider.dart';
import '../providers/language_provider/language_state_provider.dart';
import '../widgets/language_bottom_sheet.dart';
import '../widgets/setting_widget.dart';
import '../widgets/setting_with_icon_widget.dart';

class MyAccountScreen extends ConsumerWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCustomInterface = ref.watch(customInterfaceNotifierProvider);
    return Scaffold(
      appBar: appBarItem(
        context,
        title: 'My Account',
        leadingIcon: Icons.arrow_back_ios,
        leadingOnTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 20,
        ),
        child: Column(
          children: [
            SettingWithIconWidget(
              icon: Assets.shieldAlert,
              title: 'Community Code of Conduct',
              onTap: () {},
            ),
            SettingWithIconWidget(
              icon: Assets.help,
              title: 'Help Centre',
              onTap: () {},
            ),
            SettingWithIconWidget(
              icon: Assets.language,
              title: 'Edit My Languages',
              onTap: () {
                languageBottomSheet(context);
                ref.read(languageNotifierProvider.notifier).allLanguages();
              },
            ),
            Container(
              padding: const EdgeInsets.only(left: 8, right: 16),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Customize Interface',
                    style: context.textTheme.bodyMedium,
                  ),
                  CupertinoSwitch(
                    value: isCustomInterface,
                    onChanged: (value) => ref
                        .read(customInterfaceNotifierProvider.notifier)
                        .updateCustomInterface(value),
                    activeColor: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
            SettingWidget(
              title: 'Terms of Service',
              onTap: () {},
            ),
            SettingWidget(
              title: 'Privacy Policies',
              onTap: () {},
            ),
            SettingWidget(
              title: 'Temporarily Deactivate My Account',
              onTap: () {},
            ),
            SettingWidget(
              title: 'Permanently Delete My Account',
              onTap: () {},
            ),
            SettingWithIconWidget(
              icon: Assets.logout,
              title: 'Logout',
              onTap: () {},
              titleColor: AppColors.primaryColor,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    Assets.logo,
                    height: 64,
                  ),
                  padding16,
                  Text(
                    'Version 12.1.1',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                  padding72,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
