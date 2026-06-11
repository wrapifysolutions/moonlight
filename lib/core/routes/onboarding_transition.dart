import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingTransition {
  OnboardingTransition._();

  static const Duration duration = Duration(milliseconds: 1500);

  static CustomTransitionPage<void> page({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: key,
      child: child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Outgoing screen fades out
        final fadeOut = Tween<double>(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(parent: secondaryAnimation, curve: Curves.linear),
        );

        // Incoming screen fades in
        final fadeIn = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.linear));

        return FadeTransition(
          opacity: fadeOut,
          child: FadeTransition(opacity: fadeIn, child: child),
        );
      },
    );
  }
}
