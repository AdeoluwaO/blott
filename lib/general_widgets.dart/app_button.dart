import 'package:blott/core/utils/index.dart';
import 'package:blott/general_widgets.dart/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.color,
    this.textColor,
    this.width,
    this.text,
    this.onTap,
    this.padding,
    this.margin,
    this.height = 55,
    this.onRetry,
    this.isLoading = false,
    this.isEnabled = true,
    this.hasError = false,
    this.hasBorder = false,
    this.textStyle,
    this.prefixWidget,
    this.suffixWidget,
    this.noRadius = false,
    this.paddingSelf,
  });
  final Color? color, textColor;
  final TextStyle? textStyle;
  final String? text;
  final void Function()? onTap, onRetry;
  final double? width, height;
  final EdgeInsetsGeometry? padding, margin, paddingSelf;
  final bool isLoading, isEnabled, hasError, hasBorder;
  final Widget? prefixWidget, suffixWidget;
  final bool noRadius;
  @override
  Widget build(BuildContext context) {
    final bool hasFocus = FocusScope.of(context).hasFocus;

    return GestureDetector(
      onTap: hasError
          ? onRetry
          : isLoading
              ? null
              : (!isEnabled
                  ? null
                  : () {
                      if (hasFocus) {
                        FocusScope.of(context).unfocus();
                      }
                      onTap?.call();
                    }),
      // borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: paddingSelf ?? EdgeInsets.zero,
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
          margin:
              margin ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          decoration: BoxDecoration(
            border: hasBorder ? Border.all(width: 1) : null,
            borderRadius: noRadius ? null : BorderRadius.circular(30),
            color: color ??
                (isEnabled ? AppColors.blue : AppColors.blue.withOpacity(0.08)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixWidget != null && !isLoading) prefixWidget!,
              if (prefixWidget != null && !isLoading) const SizedBox(width: 4),
              if (!isLoading)
                AppText(
                  text: text ?? 'click',
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      AppTextStyle.bodySmall.copyWith(
                        fontSize: 16,
                        color: isEnabled
                            ? (textColor ?? AppColors.white)
                            : AppColors.white.withOpacity(0.08),
                      ),
                ),
              if (suffixWidget != null && !isLoading) const SizedBox(width: 4),
              if (suffixWidget != null && !isLoading) suffixWidget!,
              if (isLoading) const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
