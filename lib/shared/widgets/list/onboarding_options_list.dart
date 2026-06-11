import 'package:flutter/material.dart';

import 'package:moonlight/utils/device/responsive_sizes.dart';

class OnboardingOptionsList extends StatelessWidget {
  const OnboardingOptionsList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: itemCount,
        separatorBuilder: (_, _) => SizedBox(height: AppSizes.height(1.2)),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
