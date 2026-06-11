import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class MilestoneItem extends StatelessWidget {
  const MilestoneItem({
    super.key,
    required this.opacity,
    required this.isActive,
    required this.iconSize,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final double opacity;
  final bool isActive;
  final double iconSize;
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: iconSize,
              height: iconSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? AppColors.textPrimary
                    : AppColors.milestoneIconInactive,
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.6),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: isActive ? 15 : 10,
                    spreadRadius: isActive ? 2 : 0,
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: AppSizes.width(5),
                color: isActive
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: 0.8),
              ),
            ),
            SizedBox(width: AppSizes.width(6)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: TextStyles.fontFamily,
                      fontSize: AppSizes.font(15),
                      fontWeight: FontWeight.w600,
                      color: AppColors.milestoneTitle,
                    ),
                  ),
                  SizedBox(height: AppSizes.height(0.5)),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: TextStyles.fontFamily,
                      fontSize: AppSizes.font(13),
                      fontWeight: FontWeight.w400,
                      color: AppColors.milestoneSubtitle,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
