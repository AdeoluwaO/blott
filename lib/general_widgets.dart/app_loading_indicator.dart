import 'package:blott/core/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        child: Transform.scale(
          scale: 4,
          child: Lottie.asset(AppImages.loading),
        ),
      ),
    );
  }
}
