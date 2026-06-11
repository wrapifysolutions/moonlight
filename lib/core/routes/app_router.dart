import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:moonlight/core/routes/onboarding_transition.dart';
import 'package:moonlight/core/routes/route_names.dart';
import 'package:moonlight/features/home/home_page.dart';
import 'package:moonlight/features/payment/view/journey%20/journey_log_screen.dart';
import 'package:moonlight/features/payment/view/paywall/paywall_screen.dart';
import 'package:moonlight/features/processing/view/processing/processing_screen.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_about.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_age.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_biggest_lesson.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_children.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_dob.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_dream_car.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_dream_city.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_dream_home.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_gender.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_holding_back.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_language.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_love_life.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_manifesting.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_manifesting_person.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_name.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_orientation.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_partner_kind.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_person_name.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_priorities.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_struggling.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_welcome.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_work.dart';
import 'package:moonlight/features/onboarding/view/onboarding/onboarding_work_feel.dart';
import 'package:moonlight/features/onboarding/view/onboarding/widgets/onboarding_shell.dart';
import 'package:moonlight/features/onboarding/view/splash/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.processing,
        name: RouteNames.processing,
        builder: (context, state) => const ProcessingScreen(),
      ),
      GoRoute(
        path: RouteNames.paywall,
        name: RouteNames.paywall,
        pageBuilder: (context, state) => OnboardingTransition.page(
          key: state.pageKey,
          child: const PaywallScreen(),
        ),
      ),
      GoRoute(
        path: RouteNames.journeyLog,
        name: RouteNames.journeyLog,
        pageBuilder: (context, state) => OnboardingTransition.page(
          key: state.pageKey,
          child: const JourneyLogScreen(),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => OnboardingShell(child: child),
        routes: [
          GoRoute(
            path: RouteNames.onboardingWelcome,
            name: RouteNames.onboardingWelcome,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingWelcome(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingLanguage,
            name: RouteNames.onboardingLanguage,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingLanguage(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingName,
            name: RouteNames.onboardingName,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingName(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingAge,
            name: RouteNames.onboardingAge,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingAge(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingDob,
            name: RouteNames.onboardingDob,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingDob(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingGender,
            name: RouteNames.onboardingGender,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingGender(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingOrientation,
            name: RouteNames.onboardingOrientation,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingOrientation(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingChildren,
            name: RouteNames.onboardingChildren,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingChildren(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingAbout,
            name: RouteNames.onboardingAbout,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingAbout(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingWork,
            name: RouteNames.onboardingWork,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingWork(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingWorkFeel,
            name: RouteNames.onboardingWorkFeel,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingWorkFeel(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingBiggestLesson,
            name: RouteNames.onboardingBiggestLesson,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingBiggestLesson(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingStruggling,
            name: RouteNames.onboardingStruggling,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingStruggling(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingLoveLife,
            name: RouteNames.onboardingLoveLife,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingLoveLife(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingPriorities,
            name: RouteNames.onboardingPriorities,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingPriorities(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingManifesting,
            name: RouteNames.onboardingManifesting,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingManifesting(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingHoldingBack,
            name: RouteNames.onboardingHoldingBack,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingHoldingBack(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingDreamCity,
            name: RouteNames.onboardingDreamCity,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingDreamCity(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingDreamHome,
            name: RouteNames.onboardingDreamHome,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingDreamHome(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingManifestingPerson,
            name: RouteNames.onboardingManifestingPerson,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingManifestingPerson(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingPartnerKind,
            name: RouteNames.onboardingPartnerKind,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingPartnerKind(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingPersonName,
            name: RouteNames.onboardingPersonName,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingPersonName(),
            ),
          ),
          GoRoute(
            path: RouteNames.onboardingDreamCar,
            name: RouteNames.onboardingDreamCar,
            pageBuilder: (context, state) => OnboardingTransition.page(
              key: state.pageKey,
              child: const OnboardingDreamCar(),
            ),
          ),
        ],
      ),
    ],
  );
});

extension AppRouterExtension on BuildContext {
  void goToSplash() => goNamed(RouteNames.splash);
  void goToHome() => goNamed(RouteNames.home);
  void goToProcessing() => goNamed(RouteNames.processing);
  void goToOnboardingWelcome() => goNamed(RouteNames.onboardingWelcome);
  void goToOnboardingLanguage() => goNamed(RouteNames.onboardingLanguage);
  void goToOnboardingName() => goNamed(RouteNames.onboardingName);
  void goToOnboardingAge() => goNamed(RouteNames.onboardingAge);
  void goToOnboardingDob() => goNamed(RouteNames.onboardingDob);
  void goToOnboardingGender() => goNamed(RouteNames.onboardingGender);
  void goToOnboardingOrientation() => goNamed(RouteNames.onboardingOrientation);
  void goToOnboardingChildren() => goNamed(RouteNames.onboardingChildren);
  void goToOnboardingAbout() => goNamed(RouteNames.onboardingAbout);
  void goToOnboardingWork() => goNamed(RouteNames.onboardingWork);
  void goToOnboardingWorkFeel() => goNamed(RouteNames.onboardingWorkFeel);
  void goToOnboardingBiggestLesson() =>
      goNamed(RouteNames.onboardingBiggestLesson);
  void goToOnboardingStruggling() => goNamed(RouteNames.onboardingStruggling);
  void goToOnboardingLoveLife() => goNamed(RouteNames.onboardingLoveLife);
  void goToOnboardingPriorities() => goNamed(RouteNames.onboardingPriorities);
  void goToOnboardingManifesting() => goNamed(RouteNames.onboardingManifesting);
  void goToOnboardingHoldingBack() => goNamed(RouteNames.onboardingHoldingBack);
  void goToOnboardingDreamCity() => goNamed(RouteNames.onboardingDreamCity);
  void goToOnboardingDreamHome() => goNamed(RouteNames.onboardingDreamHome);
  void goToOnboardingManifestingPerson() =>
      goNamed(RouteNames.onboardingManifestingPerson);
  void goToOnboardingPartnerKind() => goNamed(RouteNames.onboardingPartnerKind);
  void goToOnboardingPersonName() => goNamed(RouteNames.onboardingPersonName);
  void goToOnboardingDreamCar() => goNamed(RouteNames.onboardingDreamCar);
  void goToPaywall() => goNamed(RouteNames.paywall);
  void goToJourneyLog() => goNamed(RouteNames.journeyLog);
}
