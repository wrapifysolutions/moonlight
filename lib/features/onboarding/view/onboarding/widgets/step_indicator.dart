import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class OnboardingStepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const OnboardingStepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  bool get _isNarrow =>
      AppSizes.initialized && AppSizes.screenWidth < 380;

  double get _activeDotWidth =>
      _isNarrow ? AppSizes.width(6) : AppSizes.width(8);

  double get _inactiveDotWidth =>
      _isNarrow ? AppSizes.width(1.5) : AppSizes.width(2);

  double get _dotMargin =>
      _isNarrow ? AppSizes.width(0.3) : AppSizes.width(0.5);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(totalSteps, (index) {
                final isActive = index == currentStep - 1;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.symmetric(horizontal: _dotMargin),
                  width: isActive ? _activeDotWidth : _inactiveDotWidth,
                  height: AppSizes.height(0.5),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primary
                        : Colors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(AppSizes.radius(10)),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
