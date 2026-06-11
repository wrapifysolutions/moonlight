import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moonlight/core/routes/app_router.dart';
import 'package:moonlight/features/onboarding/view/onboarding/widgets/onboarding_background.dart';
import 'package:moonlight/features/processing/view/processing/widgets/processing_globe.dart';
import 'package:moonlight/features/processing/view/processing/widgets/processing_message.dart';
import 'package:moonlight/features/processing/view/processing/widgets/processing_progress_bar.dart';
import 'package:moonlight/features/processing/viewmodel/processing_viewmodel.dart';
import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/device/responsive_layout.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/l10n/onboarding_l10n.dart';

class ProcessingScreen extends ConsumerStatefulWidget {
  const ProcessingScreen({super.key});

  @override
  ConsumerState<ProcessingScreen> createState() => ProcessingScreenState();
}

class ProcessingScreenState extends ConsumerState<ProcessingScreen>
    with TickerProviderStateMixin {
  late final ProviderSubscription<ProcessingState> processingSub;

  @override
  void initState() {
    super.initState();
    ref.read(processingProvider.notifier).start(this);
    processingSub = ref.listenManual<ProcessingState>(processingProvider, (
      _,
      next,
    ) {
      if (next.isComplete) context.goToPaywall();
    });
  }

  @override
  void dispose() {
    processingSub.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final l10n = context.l10n;
    final state = ref.watch(processingProvider);
    final messages = OnboardingL10n.processingMessages(l10n);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: OnboardingBackground(
        child: SafeArea(
          child: ResponsiveLayout(
            child: Column(
              children: [
                const Spacer(),
                const ProcessingGlobe(),
                ProcessingMessage(
                  text: messages[state.currentStep],
                  opacity: state.textOpacity,
                ),
                SizedBox(height: AppSizes.height(3)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.width(14)),
                  child: ProcessingProgressBar(progress: state.progress),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
