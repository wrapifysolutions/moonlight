import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moonlight/core/routes/app_router.dart';

import 'package:moonlight/features/onboarding/view/onboarding/widgets/onboarding_background.dart';
import 'package:moonlight/features/payment/viewmodel/paywall/paywall_viewmodel.dart';
import 'package:moonlight/shared/widgets/button/elevated_button.dart';
import 'package:moonlight/shared/widgets/card/onboarding_card.dart';
import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/device/responsive_layout.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final l10n = context.l10n;
    final state = ref.watch(paywallProvider);
    final notifier = ref.read(paywallProvider.notifier);

    return OnboardingBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ResponsiveLayout(
            child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.width(6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: AppSizes.height(2)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () => context.pop(),
                            child: Container(
                              width: AppSizes.width(10),
                              height: AppSizes.width(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 0.5,
                                ),
                              ),
                              child: Icon(
                                Icons.close,
                                color: AppColors.textPrimary,
                                size: AppSizes.width(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.height(3)),
                        Text(
                          l10n.chooseYourJourney,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: TextStyles.fontFamily,
                            fontSize: AppSizes.font(36),
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                            letterSpacing: 1.5,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: AppSizes.height(1.5)),
                        Text(
                          l10n.unlockFullPower,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: TextStyles.fontFamily,
                            fontSize: AppSizes.font(14),
                            fontWeight: FontWeight.w400,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: AppSizes.height(3)),
                        OnboardingCard(
                          label: '',
                          isPricingCard: true,
                          isSelected: state.selectedPlan == 'weekly',
                          onTap: () => notifier.selectPlan('weekly'),
                          periodLabel: l10n.weekly,
                          price: l10n.weeklyPrice,
                          badgeText: l10n.standard,
                          badgeIsGradient: false,
                        ),
                        SizedBox(height: AppSizes.height(1.2)),
                        OnboardingCard(
                          label: '',
                          isPricingCard: true,
                          isSelected: state.selectedPlan == 'monthly',
                          onTap: () => notifier.selectPlan('monthly'),
                          periodLabel: l10n.monthly,
                          price: l10n.monthlyPrice,
                          badgeText: l10n.bestValue,
                          badgeIsGradient: true,
                          subBadgeText: l10n.mostPopular,
                        ),
                        SizedBox(height: AppSizes.height(1.2)),
                        OnboardingCard(
                          label: '',
                          isPricingCard: true,
                          isSelected: state.selectedPlan == '3months',
                          onTap: () => notifier.selectPlan('3months'),
                          periodLabel: l10n.threeMonths,
                          price: l10n.threeMonthsPrice,
                          badgeText: l10n.commitmentPlan,
                          badgeIsGradient: false,
                        ),
                        SizedBox(height: AppSizes.height(3)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.width(6)),
                child: Column(
                  children: [
                    CustomElevatedButton(
                      text: l10n.payWithApplePay,
                      width: 75,
                      height: 6,
                      borderRadius: 32,
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.primary, AppColors.primaryLight],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white24,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                      icon: const Icon(
                        Icons.apple,
                        color: AppColors.textPrimary,
                      ),
                      iconPosition: IconPosition.left,
                      onPressed: () => context.goToJourneyLog(),
                    ),
                    SizedBox(height: AppSizes.height(1.5)),
                    CustomElevatedButton(
                      text: l10n.payWithCard,
                      width: 75,
                      height: 6,
                      borderRadius: 32,
                      borderColor: AppColors.primary,
                      borderWidth: 1,

                      icon: const Icon(
                        Icons.credit_card_outlined,
                        color: AppColors.textPrimary,
                      ),
                      iconPosition: IconPosition.left,
                      onPressed: () {},
                    ),
                    SizedBox(height: AppSizes.height(2)),
                    Text(
                      l10n.autoRenewNotice,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: TextStyles.fontFamily,
                        fontSize: AppSizes.font(11),
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary.withValues(alpha: 0.5),
                      ),
                    ),
                    SizedBox(height: AppSizes.height(2)),
                  ],
                ),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
