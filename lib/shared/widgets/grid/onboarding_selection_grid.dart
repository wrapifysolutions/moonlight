import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class OnboardingSelectionGridTile extends StatelessWidget {
  const OnboardingSelectionGridTile({
    super.key,
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radius(5)),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.white.withValues(alpha: 0.4),
            width: 0.5,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.width(3),
                  vertical: AppSizes.height(2),
                ),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: TextStyles.fontFamily,
                    fontSize: AppSizes.responsiveFont(14),
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
            if (isSelected)
              Positioned(
                top: AppSizes.height(1),
                right: AppSizes.width(2),
                child: Container(
                  width: AppSizes.width(5),
                  height: AppSizes.width(5),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.check,
                    color: AppColors.textPrimary,
                    size: AppSizes.icon(1.8),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class OnboardingSelectionGrid extends StatelessWidget {
  const OnboardingSelectionGrid({
    super.key,
    required this.options,
    required this.selectedOptions,
    required this.onToggle,
    this.crossAxisCount = 2,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.childAspectRatio = 2.4,
  });

  final List<String> options;
  final List<String> selectedOptions;
  final ValueChanged<String> onToggle;
  final int crossAxisCount;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing ?? AppSizes.height(1.2),
          crossAxisSpacing: crossAxisSpacing ?? AppSizes.width(3),
          childAspectRatio: childAspectRatio,
        ),
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          final isSelected = selectedOptions.contains(option);

          return OnboardingSelectionGridTile(
            label: option,
            isSelected: isSelected,
            onTap: () => onToggle(option),
          );
        },
      ),
    );
  }
}
