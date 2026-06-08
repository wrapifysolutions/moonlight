import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.height,
    this.width,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.minLines,
    this.enabled = true,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius,
    this.contentPadding,
    this.onSuffixTap,
    this.prefixPadding,
    this.suffixPadding,
    this.hintTextStyle,
    this.labelText,
    this.labelStyle,
    this.readOnly = false,
    this.onTap,
    this.focusNode,
    this.textInputAction,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.onEditingComplete,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final double? height;
  final double? width;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final int? maxLines;
  final int? minLines;
  final bool enabled;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onSuffixTap;
  final EdgeInsetsGeometry? prefixPadding;
  final EdgeInsetsGeometry? suffixPadding;
  final TextStyle? hintTextStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final bool readOnly;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final List<String>? autofillHints;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final defaultFillColor =
        fillColor ?? (isDark ? AppColors.darkSurface : AppColors.lightSurface);
    final defaultBorderColor = borderColor ??
        (isDark ? AppColors.darkOnSurface.withValues(alpha: 0.2) : const Color(0xFFE5E7EB));
    final defaultFocusedBorderColor = focusedBorderColor ?? colorScheme.primary;
    final defaultDisabledBorderColor = isDark
        ? AppColors.darkOnSurface.withValues(alpha: 0.1)
        : AppColors.lightOnSurface.withValues(alpha: 0.15);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: labelStyle ??
                Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSizes.font(11),
                      fontFamily: TextStyles.fontFamily,
                    ),
          ),
          SizedBox(height: AppSizes.height(1)),
        ],
        SizedBox(
          height: height,
          width: width,
          child: Theme(
            data: Theme.of(context).copyWith(
              textSelectionTheme: TextSelectionThemeData(
                selectionHandleColor: colorScheme.primary,
                cursorColor: colorScheme.primary,
                selectionColor: colorScheme.primary.withValues(alpha: 0.3),
              ),
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              validator: validator,
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              maxLines: maxLines,
              minLines: minLines,
              enabled: enabled,
              readOnly: readOnly,
              cursorColor: colorScheme.primary,
              onTap: onTap,
              inputFormatters: inputFormatters,
              focusNode: focusNode,
              textInputAction: textInputAction,
              textCapitalization: textCapitalization,
              autofillHints: autofillHints,
              onEditingComplete: onEditingComplete,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: AppSizes.font(12),
                    color: colorScheme.onSurface,
                    fontFamily: TextStyles.fontFamily,
                  ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  fontSize: AppSizes.font(10),
                  height: 1.2,
                  fontFamily: TextStyles.fontFamily,
                ),
                errorMaxLines: 1,
                isDense: true,
                isCollapsed: false,
                hintText: hintText,
                hintStyle: hintTextStyle ??
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: AppSizes.font(12),
                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                          fontFamily: TextStyles.fontFamily,
                        ),
                prefixIcon: prefixIcon != null
                    ? Padding(
                        padding: prefixPadding ??
                            AppSizes.paddingOnly(left: 1, right: 2),
                        child: prefixIcon,
                      )
                    : null,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
                suffixIcon: suffixIcon != null
                    ? GestureDetector(
                        onTap: onSuffixTap,
                        child: Padding(
                          padding: suffixPadding ??
                              AppSizes.paddingOnly(right: 2),
                          child: suffixIcon,
                        ),
                      )
                    : null,
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
                filled: true,
                fillColor: defaultFillColor,
                contentPadding: contentPadding ??
                    EdgeInsets.symmetric(
                      horizontal: AppSizes.width(2),
                      vertical: AppSizes.height(2),
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? AppSizes.radius(8),
                  ),
                  borderSide: BorderSide(
                    color: defaultBorderColor,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? AppSizes.radius(8),
                  ),
                  borderSide: BorderSide(
                    color: defaultBorderColor,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? AppSizes.radius(8),
                  ),
                  borderSide: BorderSide(
                    color: defaultFocusedBorderColor,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? AppSizes.radius(8),
                  ),
                  borderSide: BorderSide(
                    color: AppColors.error,
                    width: 1.5,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? AppSizes.radius(8),
                  ),
                  borderSide: BorderSide(
                    color: AppColors.error,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? AppSizes.radius(8),
                  ),
                  borderSide: BorderSide(
                    color: defaultDisabledBorderColor,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
