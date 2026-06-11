import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

enum IconPosition { left, right }

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color textColor;
  final double? fontSize;
  final VoidCallback? onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? icon;
  final List<BoxShadow>? boxShadow;
  final IconPosition iconPosition;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.gradient,
    this.textColor = AppColors.textPrimary,
    required this.onPressed,
    this.fontSize,
    this.borderRadius = 8,
    this.padding,
    this.width,
    this.height,
    this.borderColor,
    this.borderWidth,
    this.icon,
    this.boxShadow,
    this.iconPosition = IconPosition.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? AppSizes.width(width!) : null,
      height: height != null ? AppSizes.height(height!) : null,
      decoration: BoxDecoration(
        gradient: gradient,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.radius(borderRadius)),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth ?? 1)
            : null,
        boxShadow: boxShadow,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius(borderRadius)),
          ),
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: AppSizes.height(1.5),
                horizontal: AppSizes.width(4),
              ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && iconPosition == IconPosition.left) ...[
              icon!,
              SizedBox(width: AppSizes.width(2)),
            ],
            Text(
              text,
              style: TextStyle(
                fontFamily: TextStyles.fontFamily,
                fontSize: AppSizes.responsiveFont(fontSize ?? 16),
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            if (icon != null && iconPosition == IconPosition.right) ...[
              SizedBox(width: AppSizes.width(2)),
              icon!,
            ],
          ],
        ),
      ),
    );
  }
}