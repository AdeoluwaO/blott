import 'package:blott/core/utils/index.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      required this.text,
      this.style,
      this.textAlign,
      this.enabled = true,
      this.overflow,
      this.padding,
      this.height,
      this.width,
      this.constraints,
      this.maxLines,
      });
  final String text;
  final bool enabled;
  final TextStyle? style;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? padding;
  final TextOverflow? overflow;
  final double? height,width;
  final int? maxLines;
  final BoxConstraints? constraints;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      constraints: constraints,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
          text,
          style: style ?? AppTextStyle.bodyMedium,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        ),
      ),
    );
  }
}
