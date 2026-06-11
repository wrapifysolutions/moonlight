import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class JourneyCloseButton extends StatelessWidget {
  const JourneyCloseButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: AppSizes.width(10),
          height: AppSizes.width(10),
          decoration: BoxDecoration(
            color: AppColors.journeyCloseButtonFill,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary,
              width: 0.5,
            ),
          ),
          child: Icon(
            Icons.close,
            color: AppColors.textPrimary,
            size: AppSizes.width(4),
          ),
        ),
      ),
    );
  }
}
