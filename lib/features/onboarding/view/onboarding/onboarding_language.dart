import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moonlight/core/locale/app_locale.dart';
import 'package:moonlight/core/routes/app_router.dart';
import 'package:moonlight/shared/widgets/card/onboarding_card.dart';
import 'package:moonlight/features/onboarding/view/onboarding/widgets/step_indicator.dart';
import 'package:moonlight/features/onboarding/viewmodel/onboarding/onboarding_viewmodel.dart';
import 'package:moonlight/shared/viewmodels/locale/locale_provider.dart';
import 'package:moonlight/shared/widgets/button/elevated_button.dart';
import 'package:moonlight/shared/widgets/list/onboarding_options_list.dart';
import 'package:moonlight/shared/widgets/text/onboarding_title.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/l10n/onboarding_l10n.dart';

class OnboardingLanguage extends ConsumerWidget {
  const OnboardingLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final l10n = context.l10n;
    final state = ref.watch(onboardingProvider);
    final localeState = ref.watch(localeViewModelProvider);
    final localeNotifier = ref.read(localeViewModelProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final languages = OnboardingL10n.languageOptionCodes;

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
                primaryText: l10n.selectLanguage,
                fontSize: 30,
              ),
              SizedBox(height: AppSizes.height(4)),
              OnboardingOptionsList(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  final code = lang['code']!;
                  final appLocale = AppLocale.fromOptionCode(code);
                  final isSelected = localeState.locale == appLocale;
                  final displayName =
                      OnboardingL10n.languageDisplayName(l10n, code);

                  return OnboardingCard(
                    label: displayName,
                    isSelected: isSelected,
                    onTap: () => localeNotifier.setLocale(appLocale),
                    leadingAvatar: Container(
                      width: AppSizes.width(10),
                      height: AppSizes.width(10),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        code,
                        style: TextStyle(
                          fontFamily: TextStyles.fontFamily,
                          fontSize: AppSizes.font(16),
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
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
                    ref.read(onboardingProvider.notifier).nextStep();
                    context.goToOnboardingName();
                  },
                ),
              ),
              SizedBox(height: AppSizes.height(1.5)),
              SizedBox(
                width: double.infinity,
                child: Text(
                  l10n.stepCounter(
                    state.currentStep,
                    OnboardingNotifier.totalSteps,
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: TextStyles.fontFamily,
                    fontSize: AppSizes.font(12),
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
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
