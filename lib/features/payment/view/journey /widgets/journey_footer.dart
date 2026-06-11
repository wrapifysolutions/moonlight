import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class JourneyFooter extends StatelessWidget {
  const JourneyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Text(
      l10n.securedBy,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: TextStyles.fontFamily,
        fontSize: AppSizes.font(11),
        fontWeight: FontWeight.w400,
        color: AppColors.journeyFooterText,
      ),
    );
  }
}
