import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import 'package:moonlight/features/onboarding/viewmodel/onboarding/onboarding_background_provider.dart';
import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/images.dart';

class OnboardingBackground extends ConsumerWidget {
  const OnboardingBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoAsync = ref.watch(onboardingBackgroundProvider);

    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: videoAsync.when(
              loading: () => Container(
                key: const ValueKey('bg'),
                color: AppColors.darkBackground,
              ),
              error: (_, __) => Image.asset(
                key: const ValueKey('fallback'),
                AppImages.background,
                fit: BoxFit.cover,
              ),
              data: (controller) => controller != null
                  ? SizedBox.expand(
                      key: const ValueKey('video'),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: controller.value.size.width,
                          height: controller.value.size.height,
                          child: VideoPlayer(controller),
                        ),
                      ),
                    )
                  : Image.asset(
                      key: const ValueKey('fallback'),
                      AppImages.background,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        Positioned.fill(child: Container(color: AppColors.darkOverlay)),
        Positioned.fill(child: child),
      ],
    );
  }
}
