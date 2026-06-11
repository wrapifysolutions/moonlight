import 'package:flutter/material.dart';

import 'package:moonlight/utils/device/responsive_sizes.dart';

/// Centers and constrains content on tablet/desktop while allowing
/// full-bleed backgrounds in parent widgets like [OnboardingBackground].
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!AppSizes.isWideScreen) return child;

    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: AppSizes.contentWidth,
        child: child,
      ),
    );
  }
}
