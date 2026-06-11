import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

enum LeadingIconShape { rounded, circle }

class OnboardingCard extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final Widget? leadingIcon;
  final Widget? leadingAvatar;
  final LeadingIconShape leadingIconShape;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  // Pricing card props
  final bool isPricingCard;
  final String? periodLabel;
  final String? price;
  final String? badgeText;
  final bool badgeIsGradient;
  final String? subBadgeText;

  const OnboardingCard({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.leadingIcon,
    this.leadingAvatar,
    this.leadingIconShape = LeadingIconShape.rounded,
    this.padding,
    this.borderRadius,
    this.isPricingCard = false,
    this.periodLabel,
    this.price,
    this.badgeText,
    this.badgeIsGradient = false,
    this.subBadgeText,
  });

  @override
  Widget build(BuildContext context) {
    if (isPricingCard) {
      return _buildPricingCard();
    }
    return _buildStandardCard();
  }

  Widget _buildStandardCard() {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding:
            padding ??
            EdgeInsets.symmetric(
              horizontal: AppSizes.width(5),
              vertical: AppSizes.height(1.8),
            ),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppSizes.radius(4),
          ),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.white.withValues(alpha: 0.4),
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            if (leadingAvatar != null) ...[
              leadingAvatar!,
              SizedBox(width: AppSizes.width(4)),
            ] else if (leadingIcon != null) ...[
              Container(
                width: AppSizes.width(11),
                height: AppSizes.width(11),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  shape: leadingIconShape == LeadingIconShape.circle
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                  borderRadius: leadingIconShape == LeadingIconShape.rounded
                      ? BorderRadius.circular(AppSizes.radius(4))
                      : null,
                ),
                alignment: Alignment.center,
                child: leadingIcon!,
              ),
              SizedBox(width: AppSizes.width(4)),
            ],
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: TextStyles.fontFamily,
                  fontSize: AppSizes.responsiveFont(16),
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: AppSizes.width(3)),
            _RadioDot(isSelected: isSelected),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingCard() {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.width(7),
          vertical: AppSizes.height(1.8),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppSizes.radius(4),
          ),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.white.withValues(alpha: 0.4),
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  periodLabel ?? '',
                  style: TextStyle(
                    fontFamily: TextStyles.fontFamily,
                    fontSize: AppSizes.responsiveFont(16),
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? AppColors.primaryLight
                        : AppColors.textPrimary.withValues(alpha: 0.4),
                  ),
                ),
                SizedBox(height: AppSizes.height(0.5)),
                Text(
                  price ?? '',
                  style: TextStyle(
                    fontFamily: TextStyles.fontFamily,
                    fontSize: AppSizes.responsiveFont(26),
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _PricingBadge(
                  text: badgeText ?? '',
                  isGradient: badgeIsGradient,
                ),
                if (subBadgeText != null) ...[
                  SizedBox(height: AppSizes.height(0.8)),
                  Text(
                    subBadgeText!,
                    style: TextStyle(
                      fontFamily: TextStyles.fontFamily,
                      fontSize: AppSizes.responsiveFont(12),
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  final bool isSelected;
  const _RadioDot({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: AppSizes.width(6),
      height: AppSizes.width(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.primary : Colors.transparent,
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: AppSizes.width(2),
                height: AppSizes.width(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            )
          : null,
    );
  }
}

class _PricingBadge extends StatelessWidget {
  final String text;
  final bool isGradient;

  const _PricingBadge({required this.text, required this.isGradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.width(5),
        vertical: AppSizes.height(0.8),
      ),
      decoration: BoxDecoration(
        gradient: isGradient
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primary, AppColors.primaryLight],
              )
            : null,
        color: isGradient ? null : AppColors.primary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppSizes.radius(10)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: TextStyles.fontFamily,
          fontSize: AppSizes.responsiveFont(12),
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
