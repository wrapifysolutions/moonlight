import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moonlight/core/routes/app_router.dart';
import 'package:moonlight/shared/widgets/card/onboarding_card.dart';
import 'package:moonlight/features/onboarding/view/onboarding/widgets/step_indicator.dart';
import 'package:moonlight/features/onboarding/viewmodel/onboarding/onboarding_viewmodel.dart';
import 'package:moonlight/shared/widgets/button/elevated_button.dart';
import 'package:moonlight/shared/widgets/list/onboarding_options_list.dart';
import 'package:moonlight/shared/widgets/text/onboarding_title.dart';
import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/l10n/onboarding_l10n.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class OnboardingLoveLife extends ConsumerWidget {
  const OnboardingLoveLife({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final l10n = context.l10n;
    final options = OnboardingL10n.loveLifeOptions(l10n);
    final state = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.width(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.height(2)),

              OnboardingStepIndicator(
                currentStep: state.currentStep,
                totalSteps: OnboardingNotifier.totalSteps,
              ),

              SizedBox(height: AppSizes.height(4)),

              OnboardingTitle(
                primaryText: l10n.loveLifeTitlePrimary,
                accentText: l10n.loveLifeTitleAccent,
              ),

              SizedBox(height: AppSizes.height(4)),

              OnboardingOptionsList(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options[index];
                  final isSelected = state.loveLifeStatus == option;

                  return OnboardingCard(
                    label: option,
                    isSelected: isSelected,
                    onTap: () => notifier.setLoveLifeStatus(option),
                  );
                },
              ),

              Center(
                child: CustomElevatedButton(
                  text: l10n.next,
                  width: 65,
                  height: 6,
                  borderRadius: 8,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white24,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                  onPressed: () {
                    notifier.nextStep();
                    context.goToOnboardingPriorities();
                  },
                ),
              ),

              SizedBox(height: AppSizes.height(1.5)),

              SizedBox(
                width: double.infinity,
                child: Text(
                  l10n.stepCounter(state.currentStep, OnboardingNotifier.totalSteps),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: TextStyles.fontFamily,
                    fontSize: AppSizes.font(12),
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              SizedBox(height: AppSizes.height(3)),
            ],
          ),
        ),
      ),
    );
  }
}
