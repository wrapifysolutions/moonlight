import 'package:flutter/material.dart';

import 'package:moonlight/features/onboarding/view/onboarding/widgets/onboarding_background.dart';
import 'package:moonlight/utils/device/responsive_layout.dart';

class OnboardingShell extends StatelessWidget {
  const OnboardingShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      child: ResponsiveLayout(child: child),
    );
  }
}
