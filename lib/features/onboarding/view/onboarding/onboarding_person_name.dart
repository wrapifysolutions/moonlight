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

class OnboardingPersonName extends ConsumerStatefulWidget {
  const OnboardingPersonName({super.key});

  @override
  ConsumerState<OnboardingPersonName> createState() =>
      _OnboardingPersonNameState();
}

class _OnboardingPersonNameState extends ConsumerState<OnboardingPersonName> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
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
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                primaryText: l10n.personNameTitlePrimary,
                accentText: l10n.personNameTitleAccent,
              ),

              SizedBox(height: AppSizes.height(4)),

              CustomTextField(
                hintText: l10n.personNameHint,
                controller: _controller,
                onChanged: (val) => notifier.setManifestingPersonName(val),
                maxLines: 8,
                minLines: 8,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                textCapitalization: TextCapitalization.words,
                fillColor: Colors.white.withValues(alpha: 0.1),
                borderColor: AppColors.primary.withValues(alpha: 0.5),
                focusedBorderColor: AppColors.primary,
                borderRadius: AppSizes.radius(4),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppSizes.width(5),
                  vertical: AppSizes.height(2.5),
                ),
                hintTextStyle: TextStyle(
                  fontFamily: TextStyles.fontFamily,
                  fontSize: AppSizes.font(18),
                  fontWeight: FontWeight.w400,
                  color: AppColors.textMuted.withValues(alpha: 0.8),
                ),
              ),

                    ],
                  ),
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
                    context.goToOnboardingDreamCar();
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
