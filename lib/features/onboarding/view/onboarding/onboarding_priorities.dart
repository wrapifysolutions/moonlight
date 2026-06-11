import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moonlight/core/routes/app_router.dart';
import 'package:moonlight/features/onboarding/view/onboarding/widgets/step_indicator.dart';
import 'package:moonlight/features/onboarding/viewmodel/onboarding/onboarding_viewmodel.dart';
import 'package:moonlight/shared/widgets/button/elevated_button.dart';
import 'package:moonlight/shared/widgets/grid/onboarding_selection_grid.dart';
import 'package:moonlight/shared/widgets/text/onboarding_title.dart';
import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/l10n/onboarding_l10n.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class OnboardingPriorities extends ConsumerWidget {
  const OnboardingPriorities({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final l10n = context.l10n;
    final priorities = OnboardingL10n.priorityOptions(l10n);
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
                primaryText: l10n.prioritiesTitlePrimary,
                accentText: l10n.prioritiesTitleAccent,
              ),

              SizedBox(height: AppSizes.height(4)),

              OnboardingSelectionGrid(
                options: priorities,
                selectedOptions: state.topPriorities,
                onToggle: notifier.toggleTopPriority,
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
                    colors: [
                      AppColors.gradientStart,
                      AppColors.gradientEnd,
                    ],
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
                    context.goToOnboardingManifesting();
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
