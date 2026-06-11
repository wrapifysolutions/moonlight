import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class OnboardingTitle extends StatelessWidget {
  const OnboardingTitle({
    super.key,
    required this.primaryText,
    this.accentText = '',
    this.fontSize = 28,
    this.textAlign = TextAlign.start,
  });

  final String primaryText;
  final String accentText;
  final double fontSize;
  final TextAlign textAlign;

  TextStyle get _baseStyle => TextStyle(
        fontFamily: TextStyles.fontFamily,
        fontSize: AppSizes.responsiveFont(fontSize),
        fontWeight: FontWeight.w700,
        height: 1.2,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          children: [
            TextSpan(
              text: primaryText,
              style: _baseStyle.copyWith(color: AppColors.textPrimary),
            ),
            if (accentText.isNotEmpty)
              TextSpan(
                text: accentText,
                style: _baseStyle.copyWith(color: AppColors.primaryLight),
              ),
          ],
        ),
      ),
    );
  }
}
