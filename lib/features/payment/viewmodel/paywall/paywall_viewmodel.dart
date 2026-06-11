import 'package:flutter_riverpod/legacy.dart';

class PaywallState {
  final String selectedPlan;

  const PaywallState({this.selectedPlan = 'monthly'});

  PaywallState copyWith({String? selectedPlan}) {
    return PaywallState(selectedPlan: selectedPlan ?? this.selectedPlan);
  }
}

class PaywallNotifier extends StateNotifier<PaywallState> {
  PaywallNotifier() : super(const PaywallState());

  void selectPlan(String plan) {
    state = state.copyWith(selectedPlan: plan);
  }
}

final paywallProvider = StateNotifierProvider<PaywallNotifier, PaywallState>(
  (ref) => PaywallNotifier(),
);
