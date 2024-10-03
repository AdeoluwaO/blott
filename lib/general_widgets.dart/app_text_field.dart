import 'package:blott/core/utils/index.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  final double? width, height;
  final double? labelSize, borderWidth;
  final String? hintText;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool? enabled;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String text)? onSaved, onChange;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final bool? enableErrorMessage;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? bordercolor, backgroundColor, labelColor, textColor;
  final bool? autofocus;
  final String? label;
  final EdgeInsetsGeometry? contentPadding;
  final String? firstLabel;
  final String? lastLabel;
  final List<TextInputFormatter>? inputFormatters;
  final bool isLoading, readOnly;
  final double borderRadius;
  final BoxConstraints? constraints;

  final String? initialValue;

  const AppTextField({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.isLoading = false,
    this.hintText,
    this.controller,
    this.minLines = 1,
    this.obscureText = false,
    this.enabled = true,
    this.validateFunction,
    this.onSaved,
    this.onChange,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
    this.submitAction,
    this.enableErrorMessage = true,
    this.maxLines = 1,
    this.maxLength,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.bordercolor,
    this.autofocus,
    this.label,
    this.firstLabel,
    this.lastLabel,
    this.inputFormatters,
    this.borderRadius = 0,
    this.initialValue,
    this.labelSize,
    this.labelColor,
    this.onTap,
    this.textColor,
    this.borderWidth,
    this.contentPadding,
    this.constraints,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String? error;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      constraints: widget.constraints,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            AppText(
              text: widget.label!,
              style: AppTextStyle.titleSmall,
            ),
          if (widget.label != null) const Spacing.height(3),
          TextFormField(
            maxLength: widget.maxLength,
            readOnly: widget.readOnly,
            initialValue: widget.initialValue,
            textAlign: TextAlign.left,
            autofocus: widget.autofocus ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: widget.enabled,
            validator: widget.validateFunction != null
                ? widget.validateFunction!
                : (value) {
                    return null;
                  },
            onSaved: (val) {
              error = widget.validateFunction!(val);
              setState(() {});
              widget.onSaved!(val!);
            },
            onChanged: (val) {
              widget.validateFunction != null
                  ? error = widget.validateFunction!(val)
                  : error = null;
              setState(() {});
              if (widget.onChange != null) widget.onChange!(val);
            },
            onTap: widget.onTap,
            style: AppTextStyle.bodyLarge
                .copyWith(color: widget.textColor ?? AppColors.black),
            // cursorColor: ,
            key: widget.key,
            maxLines: widget.maxLines,
            controller: widget.controller,
            obscureText: widget.obscureText!,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              filled: true,
              enabled: false,
              contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              fillColor: widget.backgroundColor ?? AppColors.transparent,
              hintText: widget.hintText,
              hintStyle: AppTextStyle.bodyLarge.copyWith(color: AppColors.grey),
              errorStyle: TextStyle(color: AppColors.error),
              errorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: AppColors.error,
                  width: 1,
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: AppColors.error,
                  width: 1,
                ),
              ),
              disabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: AppColors.transparent,
                  width: widget.borderWidth ?? 0.5,
                ),
              ),
              labelStyle: TextStyle(
                color: AppColors.transparent,
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.bordercolor ?? AppColors.grey,
                  width: widget.borderWidth ?? 1,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.bordercolor ?? AppColors.grey,
                  width: widget.borderWidth ?? 1,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.bordercolor ?? AppColors.grey,
                  width: widget.borderWidth ?? 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
