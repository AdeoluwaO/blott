import 'package:blott/core/routers/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:blott/core/utils/index.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter_svg/svg.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SvgPicture.asset(AppImages.notifications),
          const Spacing.height(24),
          const AppText(
            text: 'Get the most out of Blott ✅',
            style: AppTextStyle.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const Spacing.height(16),
          const AppText(
            text:
                'Allow notifications to stay in the loop with\nyour payments, requests and groups.',
            style: AppTextStyle.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 2),
          // const Spacer(),
          AppButton(
            text: 'Continue',
            onTap: () {
              Navigator.pushNamed(context, RouteGenerator.news);
            },
          ),
        ],
      ),
    );
  }
}
