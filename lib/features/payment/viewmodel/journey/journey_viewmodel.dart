import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class JourneyLogState {
  final double item1Opacity;
  final double item2Opacity;
  final double item3Opacity;
  final double lineProgress;
  final double buttonOpacity;
  final bool item1Active;
  final bool item2Active;
  final bool item3Active;

  const JourneyLogState({
    this.item1Opacity = 0.0,
    this.item2Opacity = 0.0,
    this.item3Opacity = 0.0,
    this.lineProgress = 0.0,
    this.buttonOpacity = 0.0,
    this.item1Active = false,
    this.item2Active = false,
    this.item3Active = false,
  });

  JourneyLogState copyWith({
    double? item1Opacity,
    double? item2Opacity,
    double? item3Opacity,
    double? lineProgress,
    double? buttonOpacity,
    bool? item1Active,
    bool? item2Active,
    bool? item3Active,
  }) {
    return JourneyLogState(
      item1Opacity: item1Opacity ?? this.item1Opacity,
      item2Opacity: item2Opacity ?? this.item2Opacity,
      item3Opacity: item3Opacity ?? this.item3Opacity,
      lineProgress: lineProgress ?? this.lineProgress,
      buttonOpacity: buttonOpacity ?? this.buttonOpacity,
      item1Active: item1Active ?? this.item1Active,
      item2Active: item2Active ?? this.item2Active,
      item3Active: item3Active ?? this.item3Active,
    );
  }
}

class JourneyLogNotifier extends StateNotifier<JourneyLogState> {
  JourneyLogNotifier() : super(const JourneyLogState());

  AnimationController? lineController;
  AnimationController? item1Controller;
  AnimationController? item2Controller;
  AnimationController? item3Controller;
  AnimationController? buttonController;

  bool started = false;
  bool disposed = false;
  bool item2FadeTriggered = false;
  bool item3FadeTriggered = false;
  bool buttonTriggered = false;

  double item2Arrival = 0.0;
  double item3Arrival = 0.0;
  double item2Approach = 0.0;
  double item3Approach = 0.0;

  void start(TickerProvider vsync) {
    if (started) return;
    started = true;

    item2Arrival = 0.45;
    item3Arrival = 1.0;
    item2Approach = 0.33;
    item3Approach = 0.87;

    lineController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 3200),
    );
    item1Controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 600),
    );
    item2Controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 600),
    );
    item3Controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 600),
    );
    buttonController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 700),
    );

    item1Controller!.addListener(() {
      if (disposed) return;
      state = state.copyWith(item1Opacity: item1Controller!.value);
    });
    item2Controller!.addListener(() {
      if (disposed) return;
      state = state.copyWith(item2Opacity: item2Controller!.value);
    });
    item3Controller!.addListener(() {
      if (disposed) return;
      state = state.copyWith(item3Opacity: item3Controller!.value);
    });
    buttonController!.addListener(() {
      if (disposed) return;
      state = state.copyWith(buttonOpacity: buttonController!.value);
    });

    lineController!.addListener(() {
      if (disposed) return;
      final progress = lineController!.value;
      state = state.copyWith(
        lineProgress: progress,
        item2Active: progress >= item2Arrival,
        item3Active: progress >= item3Arrival,
      );

      if (!item2FadeTriggered && progress >= item2Approach) {
        item2FadeTriggered = true;
        item2Controller!.forward();
      }
      if (!item3FadeTriggered && progress >= item3Approach) {
        item3FadeTriggered = true;
        item3Controller!.forward();
      }
    });

    lineController!.addStatusListener((status) {
      if (disposed) return;
      if (status == AnimationStatus.completed && !buttonTriggered) {
        buttonTriggered = true;
        Future.delayed(const Duration(milliseconds: 300), () {
          if (!disposed) buttonController!.forward();
        });
      }
    });

    runSequence();
  }

  Future<void> runSequence() async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (disposed) return;

    item1Controller!.forward();
    state = state.copyWith(item1Active: true);
    await Future.delayed(const Duration(milliseconds: 700));
    if (disposed) return;

    lineController!.forward();
  }

  @override
  void dispose() {
    disposed = true;
    lineController?.dispose();
    item1Controller?.dispose();
    item2Controller?.dispose();
    item3Controller?.dispose();
    buttonController?.dispose();
    super.dispose();
  }
}

final journeyLogProvider =
    StateNotifierProvider.autoDispose<JourneyLogNotifier, JourneyLogState>(
      (ref) => JourneyLogNotifier(),
    );
