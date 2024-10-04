import 'package:blott/core/utils/app_colors.dart';
import 'package:blott/core/utils/app_text_styles.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter/material.dart';

class AppErrorIndicator extends StatelessWidget {
  const AppErrorIndicator({
    super.key,
    required this.onTapTryAgain,
    this.errorMessaage,
    this.buttonTitle,
    this.textAlign,
    this.mainAxisAlignment,
  });
  final String? errorMessaage, buttonTitle;
  final void Function() onTapTryAgain;
  final MainAxisAlignment? mainAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        AppText(
          text: errorMessaage ?? 'An error occured',
          style: AppTextStyle.bodyLarge.copyWith(color: AppColors.white),
          textAlign: textAlign ?? TextAlign.center,
        ),
        const Spacing.height(20),
        AppButton(
          text: buttonTitle ?? 'Try again',
          onTap: onTapTryAgain,
        ),
      ],
    );
  }
}
