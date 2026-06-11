import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moonlight/core/routes/app_router.dart';
import 'package:moonlight/features/onboarding/view/onboarding/widgets/onboarding_background.dart';
import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/device/responsive_layout.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Short initial delay, then animate in, then navigate
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _controller.forward();
    });

    Future.delayed(const Duration(milliseconds: 2800), () {
      if (mounted) context.goToOnboardingWelcome();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: OnboardingBackground(
        child: ResponsiveLayout(
          child: Center(
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.appName,
                      style: TextStyle(
                        fontFamily: TextStyles.fontFamily,
                        fontSize: AppSizes.responsiveFont(50),
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        height: 1.15,
                      ),
                    ),
                    Text(
                      l10n.appTagline,
                      style: TextStyle(
                        fontFamily: TextStyles.fontFamily,
                        fontSize: AppSizes.responsiveFont(50),
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                        height: 1.15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
