import 'package:flutter/material.dart';

import '../../../core/atomic/molecules/app_bar_item.dart';

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
      body: const Column(
        children: [],
      ),
    );
  }
}
