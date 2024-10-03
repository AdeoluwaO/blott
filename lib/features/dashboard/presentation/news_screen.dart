import 'package:blott/core/utils/index.dart';
import 'package:blott/features/dashboard/presentation/widgets/news_item_widget.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Hey {first_name}',
          style: AppTextStyle.headlineLarge.copyWith(color: AppColors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.prupleBlack,
      ),
      applySafeArea: false,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: AppColors.primary,
      body: AppListViewBuilder(
        itemCount: 16,
        itemBuilder: (context, index) {
          return NewsItemWidget();
        },
        // separatorBuilder: (context, index) {
        //   return const Spacing.height(height);
        // },
      ),
    );
  }
}
