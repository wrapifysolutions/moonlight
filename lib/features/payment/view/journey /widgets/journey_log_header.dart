import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class JourneyLogHeader extends StatelessWidget {
  const JourneyLogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Text(
          l10n.journeyLog,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: TextStyles.fontFamily,
            fontSize: AppSizes.font(36),
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: AppSizes.height(1.5)),
        Text(
          l10n.celestialAlignmentComplete,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: TextStyles.fontFamily,
            fontSize: AppSizes.font(14),
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
