import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import 'package:moonlight/utils/constants/images.dart';

final onboardingBackgroundProvider =
    AsyncNotifierProvider<OnboardingBackgroundNotifier, VideoPlayerController?>(
  OnboardingBackgroundNotifier.new,
);

class OnboardingBackgroundNotifier
    extends AsyncNotifier<VideoPlayerController?> {
  @override
  Future<VideoPlayerController?> build() async {
    final controller = VideoPlayerController.asset(AppImages.globeVideo);

    try {
      await controller.initialize();
      await controller.seekTo(Duration.zero);
      await controller.setLooping(true);
      await controller.setVolume(0);
      await controller.play();

      ref.onDispose(controller.dispose);

      return controller;
    } catch (_) {
      await controller.dispose();
      return null;
    }
  }
}
