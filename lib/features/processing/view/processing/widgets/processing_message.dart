import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class ProcessingMessage extends StatelessWidget {
  const ProcessingMessage({
    super.key,
    required this.text,
    required this.opacity,
  });

  final String text;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.width(10)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: TextStyles.fontFamily,
            fontSize: AppSizes.font(24),
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}
