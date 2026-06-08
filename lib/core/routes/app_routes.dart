import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:moonlight/core/routes/route_names.dart';
import 'package:moonlight/features/home/home_page.dart';
import 'package:moonlight/features/onboarding/view/onboarding_page.dart';

part 'app_routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: RouteNames.home,
  name: RouteNames.homeName,
)
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage(title: 'Moonlight');
  }
}

@TypedGoRoute<OnboardingRoute>(
  path: RouteNames.onboarding,
  name: RouteNames.onboardingName,
)
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnboardingPage();
  }
}
