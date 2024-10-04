import 'package:blott/core/helpers/index.dart';
import 'package:blott/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.buttonEnabled = true,
    this.height,
    this.width,
    this.iconSize,
    this.color,
    this.iconColor,
    this.borderRadius,
    this.padding,
    this.paddingSelf,
    required this.onTap,
  });

  final bool buttonEnabled;
  final double? height, width, iconSize;
  final Color? color, iconColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding, paddingSelf;
  final IconData? icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingSelf ?? EdgeInsets.zero,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: buttonEnabled
              ? (color ?? AppColors.blue)
              : (color ?? AppColors.blue).withOpacity(0.08),
          borderRadius: borderRadius,
        ),
        child: Icon(
          icon,
          size: iconSize ?? 40,
          color: iconColor ?? AppColors.white,
        ),
      ).addTapGesture(
        onTap: buttonEnabled ? onTap : () {},
      ),
    );
  }
}
