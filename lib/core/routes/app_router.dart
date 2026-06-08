import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:moonlight/core/routes/app_routes.dart';
import 'package:moonlight/core/routes/route_names.dart';

typedef RouterRefreshRegistration = ProviderSubscription<Object?> Function(
  Ref ref,
  VoidCallback onRefresh,
);

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = _RouterNotifier(ref, [
    // (ref, onRefresh) => ref.listen(authStateProvider, (_, __) => onRefresh()),
  ]);

  ref.onDispose(notifier.dispose);

  return GoRouter(
    initialLocation: RouteNames.home,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: notifier,
    redirect: (context, state) {
      // add auth redirect logic here later
      return null;
    },
    routes: $appRoutes,
  );
});

class _RouterNotifier extends ChangeNotifier {
  final List<ProviderSubscription<Object?>> _subs = [];

  _RouterNotifier(Ref ref, List<RouterRefreshRegistration> registrations) {
    for (final register in registrations) {
      _subs.add(register(ref, notifyListeners));
    }
  }

  @override
  void dispose() {
    for (final s in _subs) {
      s.close();
    }
    super.dispose();
  }
}

extension AppRouterExtension on BuildContext {
  void goToHome() => const HomeRoute().go(this);

  void goToOnboarding() => const OnboardingRoute().go(this);
}
