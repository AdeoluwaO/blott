import 'package:blott/core/utils/index.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter/material.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Image.network(
            AppConstants.developmentTestImage,
            height: 100,
            width: 100,
            cacheHeight: 100,
            cacheWidth: 100,
          ),
          const Spacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'The Economic Times',
                      style: AppTextStyle.titleSmall
                          .copyWith(color: AppColors.white.withOpacity(0.7)),
                    ),
                    
                    AppText(
                      text: '12 June 2021',
                      style: AppTextStyle.titleSmall
                          .copyWith(color: AppColors.white.withOpacity(0.7)),
                    ),
                  ],
                ),
                const Spacing.height(8),
                AppText(
                  text:
                      'Markets FTSE slides almost 2pc as sterling sinks to 1.38',
                  width: 260,
                  style: AppTextStyle.bodySmall.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
