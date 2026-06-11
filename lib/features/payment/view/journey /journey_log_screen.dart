import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:moonlight/core/routes/app_router.dart';
import 'package:moonlight/features/onboarding/view/onboarding/widgets/onboarding_background.dart';
import 'package:moonlight/features/payment/view/journey /widgets/journey_close_button.dart';
import 'package:moonlight/features/payment/view/journey /widgets/journey_footer.dart';
import 'package:moonlight/features/payment/view/journey /widgets/journey_log_header.dart';
import 'package:moonlight/features/payment/view/journey /widgets/journey_timeline.dart';
import 'package:moonlight/features/payment/viewmodel/journey/journey_viewmodel.dart';
import 'package:moonlight/shared/widgets/button/elevated_button.dart';
import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/device/responsive_layout.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class JourneyLogScreen extends ConsumerStatefulWidget {
  const JourneyLogScreen({super.key});

  @override
  ConsumerState<JourneyLogScreen> createState() => JourneyLogScreenState();
}

class JourneyLogScreenState extends ConsumerState<JourneyLogScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(journeyLogProvider.notifier).start(this);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final l10n = context.l10n;
    final state = ref.watch(journeyLogProvider);

    final double iconSize = AppSizes.width(12);
    final double itemGap = AppSizes.height(5);

    return OnboardingBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ResponsiveLayout(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.width(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: AppSizes.height(2)),
                JourneyCloseButton(onTap: () => context.pop()),
                SizedBox(height: AppSizes.height(3)),
                const JourneyLogHeader(),
                SizedBox(height: AppSizes.height(5)),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: JourneyTimeline(
                      lineProgress: state.lineProgress,
                      item1Opacity: state.item1Opacity,
                      item1Active: state.item1Active,
                      item2Opacity: state.item2Opacity,
                      item2Active: state.item2Active,
                      item3Opacity: state.item3Opacity,
                      item3Active: state.item3Active,
                      iconSize: iconSize,
                      itemGap: itemGap,
                    ),
                  ),
                ),
                Opacity(
                  opacity: state.buttonOpacity,
                  child: CustomElevatedButton(
                    text: l10n.continueTheJourney,
                    width: 80,
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
                      Icons.arrow_forward,
                      color: AppColors.textPrimary,
                    ),
                    iconPosition: IconPosition.right,
                    onPressed: state.buttonOpacity > 0.5
                        ? () => context.goToHome()
                        : null,
                  ),
                ),
                SizedBox(height: AppSizes.height(1.5)),
                const JourneyFooter(),
                SizedBox(height: AppSizes.height(2)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
