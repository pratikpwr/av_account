import 'package:flutter/material.dart';

class IconItem extends StatelessWidget {
  const IconItem(
    this.iconPath, {
    super.key,
    this.size = 16,
    this.color,
  });

  final String iconPath;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconPath,
      height: size,
      width: size,
      color: color,
      fit: BoxFit.cover,
    );
  }
}
