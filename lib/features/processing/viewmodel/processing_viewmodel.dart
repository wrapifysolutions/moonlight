import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/legacy.dart';

class ProcessingState {
  final int currentStep;
  final double progress;
  final double textOpacity;
  final bool isComplete;

  const ProcessingState({
    this.currentStep = 0,
    this.progress = 0.0,
    this.textOpacity = 0.0,
    this.isComplete = false,
  });

  ProcessingState copyWith({
    int? currentStep,
    double? progress,
    double? textOpacity,
    bool? isComplete,
  }) => ProcessingState(
    currentStep: currentStep ?? this.currentStep,
    progress: progress ?? this.progress,
    textOpacity: textOpacity ?? this.textOpacity,
    isComplete: isComplete ?? this.isComplete,
  );
}

class ProcessingNotifier extends StateNotifier<ProcessingState> {
  ProcessingNotifier() : super(const ProcessingState());

  static const Duration totalDuration = Duration(seconds: 6);
  static const Duration fadeDuration = Duration(milliseconds: 300);
  static const List<double> stepThresholds = [0.0, 0.25, 0.50, 0.75];

  late AnimationController progressController;
  late AnimationController fadeController;
  bool isFading = false;
  bool disposed = false;
  bool started = false;

  void start(TickerProvider vsync) {
    if (started) return;
    started = true;

    progressController = AnimationController(
      vsync: vsync,
      duration: totalDuration,
    );

    fadeController = AnimationController(vsync: vsync, duration: fadeDuration);

    fadeController.addListener(() {
      if (disposed) return;
      state = state.copyWith(textOpacity: fadeController.value);
    });

    progressController.addListener(onTick);

    progressController.addStatusListener((status) {
      if (disposed) return;
      if (status == AnimationStatus.completed) {
        state = state.copyWith(isComplete: true);
      }
    });

    fadeController.forward().then((_) {
      if (!disposed) progressController.forward();
    });
  }

  void onTick() {
    if (disposed) return;

    final progress = progressController.value;
    state = state.copyWith(progress: progress);

    int newStep = 0;
    for (int i = stepThresholds.length - 1; i >= 0; i--) {
      if (progress >= stepThresholds[i]) {
        newStep = i;
        break;
      }
    }

    if (newStep != state.currentStep && !isFading) {
      isFading = true;
      fadeController.reverse().then((_) {
        if (disposed) return;
        state = state.copyWith(currentStep: newStep);
        fadeController.forward().then((_) {
          if (!disposed) isFading = false;
        });
      });
    }
  }

  @override
  void dispose() {
    disposed = true;
    if (started) {
      progressController.dispose();
      fadeController.dispose();
    }
    super.dispose();
  }
}

final processingProvider =
    StateNotifierProvider.autoDispose<ProcessingNotifier, ProcessingState>(
      (ref) => ProcessingNotifier(),
    );
