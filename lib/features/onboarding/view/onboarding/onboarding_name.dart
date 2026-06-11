import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moonlight/core/routes/app_router.dart';
import 'package:moonlight/features/onboarding/view/onboarding/widgets/step_indicator.dart';
import 'package:moonlight/features/onboarding/viewmodel/onboarding/onboarding_viewmodel.dart';
import 'package:moonlight/shared/widgets/button/elevated_button.dart';
import 'package:moonlight/shared/widgets/text/onboarding_title.dart';
import 'package:moonlight/shared/widgets/textfield/textfield.dart';
import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class OnboardingName extends ConsumerStatefulWidget {
  const OnboardingName({super.key});

  @override
  ConsumerState<OnboardingName> createState() => _OnboardingNameState();
}

class _OnboardingNameState extends ConsumerState<OnboardingName> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final l10n = context.l10n;
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
                    primaryText: l10n.nameTitlePrimary,
                    accentText: l10n.nameTitleAccent,
                    fontSize: 30,
                  ),

                  SizedBox(height: AppSizes.height(4)),

                  // Label
                  Text(
                    l10n.yourNameLabel,
                    style: TextStyle(
                      fontFamily: TextStyles.fontFamily,
                      fontSize: AppSizes.font(16),
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: AppSizes.height(1)),

                  // Underline-style input using CustomTextField
                  CustomTextField(
                    hintText: l10n.enterYourNameHint,
                    controller: _nameController,
                    onChanged: (val) => notifier.setName(val),
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    fillColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    focusedBorderColor: Colors.transparent,
                    borderRadius: 0,
                    contentPadding: EdgeInsets.only(bottom: AppSizes.height(1)),
                    hintTextStyle: TextStyle(
                      fontFamily: TextStyles.fontFamily,
                      fontSize: AppSizes.font(16),
                      fontWeight: FontWeight.w400,
                      color: AppColors.textMuted.withValues(alpha: 0.4),
                    ),
                  ),

                  // Glowing underline divider
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0),
                          AppColors.primary,
                          AppColors.primary.withValues(alpha: 0),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.6),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

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
                        context.goToOnboardingAge();
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
