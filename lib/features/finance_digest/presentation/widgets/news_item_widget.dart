import 'package:blott/core/helpers/extensions.dart';
import 'package:blott/core/helpers/helper_functions.dart';
import 'package:blott/core/utils/index.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter/material.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    super.key,
    required this.source,
    required this.image,
    required this.headline,
    required this.date,
    required this.onTap,
  });

  final String source, image, headline;
  final DateTime date;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Image.network(image,
            height: 100,
            width: 100,
            cacheHeight: 100,
            cacheWidth: 100,
          ),
          const Spacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: source.toUpperCase(),
                      style: AppTextStyle.titleSmall
                          .copyWith(color: AppColors.white.withOpacity(0.7)),
                    ),
                    AppText(
                      text: HelperFunctions.formatDate(
                          dateTime: date, dateFormat: 'dd MMM yyyy').toUpperCase(),
                      style: AppTextStyle.titleSmall
                          .copyWith(color: AppColors.white.withOpacity(0.7)),
                    ),
                  ],
                ),
                const Spacing.height(8),
                AppText(
                  text: headline,
                  width: 260,
                  style:
                      AppTextStyle.bodySmall.copyWith(color: AppColors.white),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    ).addTapGesture(onTap: onTap);
  }
}
