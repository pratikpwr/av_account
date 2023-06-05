import 'package:av_account/src/core/atomic/atoms/padding.dart';
import 'package:av_account/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/atomic/molecules/app_bar_item.dart';
import '../../../core/constants/assets.dart';
import '../../../core/themes/app_colors.dart';
import '../widgets/setting_widget.dart';
import '../widgets/setting_with_icon_widget.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onTap: () {},
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
