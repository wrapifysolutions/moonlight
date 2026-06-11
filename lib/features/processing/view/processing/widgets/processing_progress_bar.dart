import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class ProcessingProgressBar extends StatelessWidget {
  const ProcessingProgressBar({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final fillWidth = (totalWidth * progress).clamp(0.0, totalWidth);

        return Container(
          height: AppSizes.height(1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radius(10)),
            color: Colors.white.withValues(alpha: 0.1),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radius(10)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                duration: Duration.zero,
                width: fillWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.radius(10)),
                  gradient: const LinearGradient(
                    colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryLight.withValues(alpha: 0.8),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
