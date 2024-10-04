import 'package:blott/core/utils/app_colors.dart';
import 'package:blott/core/utils/app_text_styles.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter/material.dart';

class AppErrorIndicator extends StatelessWidget {
  const AppErrorIndicator(
      {super.key, required this.onTapTryAgain, this.errorMessaage});
  final String? errorMessaage;
  final void Function() onTapTryAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: errorMessaage ?? 'An error occured',
          style: AppTextStyle.bodyLarge.copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
        const Spacing.height(20),
        AppButton(
          text: 'Try again',
          onTap: onTapTryAgain,
          
        ),
      ],
    );
  }
}
