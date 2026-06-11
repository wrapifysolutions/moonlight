import 'package:flutter_riverpod/legacy.dart';

class OnboardingState {
  final int currentStep;
  final String name;
  final int age;
  final DateTime dob;
  final String gender;
  final String sexualOrientation;
  final String hasChildren;
  final String aboutYourself;
  final String work;
  final String workFeel;
  final String biggestLesson;
  final String strugglingWith;
  final String loveLifeStatus;
  final List<String> topPriorities;
  final String manifestingDescription;
  final String holdingYouBack;
  final String dreamCity;
  final String dreamHome;
  final String manifestingPerson;
  final String kindOfPartner;
  final String manifestingPersonName;
  final String dreamCar;

  OnboardingState({
    this.currentStep = 1,
    this.name = '',
    this.age = 25,
    this.gender = '',
    this.sexualOrientation = '',
    this.hasChildren = '',
    DateTime? dob,
    this.work = '',
    this.aboutYourself = '',
    this.workFeel = '',
    this.biggestLesson = '',
    this.strugglingWith = '',
    this.loveLifeStatus = '',
    this.topPriorities = const [],
    this.manifestingDescription = '',
    this.holdingYouBack = '',
    this.dreamCity = '',
    this.dreamHome = '',
    this.manifestingPerson = '',
    this.kindOfPartner = '',
    this.manifestingPersonName = '',
    this.dreamCar = '',
  }) : dob = dob ?? DateTime(1995, 11, 21);

  OnboardingState copyWith({
    int? currentStep,
    String? name,
    int? age,
    DateTime? dob,
    String? gender,
    String? sexualOrientation,
    String? hasChildren,
    String? aboutYourself,
    String? work,
    String? workFeel,
    String? biggestLesson,
    String? strugglingWith,
    String? loveLifeStatus,
    List<String>? topPriorities,
    String? manifestingDescription,
    String? holdingYouBack,
    String? dreamCity,
    String? dreamHome,
    String? manifestingPerson,
    String? kindOfPartner,
    String? manifestingPersonName,
    String? dreamCar,
  }) {
    return OnboardingState(
      currentStep: currentStep ?? this.currentStep,
      name: name ?? this.name,
      age: age ?? this.age,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      sexualOrientation: sexualOrientation ?? this.sexualOrientation,
      hasChildren: hasChildren ?? this.hasChildren,
      aboutYourself: aboutYourself ?? this.aboutYourself,
      work: work ?? this.work,
      workFeel: workFeel ?? this.workFeel,
      biggestLesson: biggestLesson ?? this.biggestLesson,
      strugglingWith: strugglingWith ?? this.strugglingWith,
      loveLifeStatus: loveLifeStatus ?? this.loveLifeStatus,
      topPriorities: topPriorities ?? this.topPriorities,
      manifestingDescription:
          manifestingDescription ?? this.manifestingDescription,
      holdingYouBack: holdingYouBack ?? this.holdingYouBack,
      dreamCity: dreamCity ?? this.dreamCity,
      dreamHome: dreamHome ?? this.dreamHome,
      manifestingPerson: manifestingPerson ?? this.manifestingPerson,
      kindOfPartner: kindOfPartner ?? this.kindOfPartner,
      manifestingPersonName:
          manifestingPersonName ?? this.manifestingPersonName,
      dreamCar: dreamCar ?? this.dreamCar,
    );
  }
}

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(OnboardingState());

  static const int totalSteps = 23;

  void nextStep() {
    if (state.currentStep < totalSteps) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 1) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void setName(String name) => state = state.copyWith(name: name);
  void setAge(int age) => state = state.copyWith(age: age);
  void setDob(DateTime dob) => state = state.copyWith(dob: dob);
  void goToStep(int step) => state = state.copyWith(currentStep: step);
  void setGender(String gender) => state = state.copyWith(gender: gender);
  void setSexualOrientation(String v) =>
      state = state.copyWith(sexualOrientation: v);
  void setHasChildren(String v) => state = state.copyWith(hasChildren: v);
  void setAboutYourself(String v) => state = state.copyWith(aboutYourself: v);
  void setWork(String v) => state = state.copyWith(work: v);
  void setWorkFeel(String v) => state = state.copyWith(workFeel: v);
  void setBiggestLesson(String v) => state = state.copyWith(biggestLesson: v);
  void setStrugglingWith(String v) => state = state.copyWith(strugglingWith: v);
  void setLoveLifeStatus(String v) => state = state.copyWith(loveLifeStatus: v);

  void toggleTopPriority(String priority) {
    final current = List<String>.from(state.topPriorities);
    if (current.contains(priority)) {
      current.remove(priority);
    } else {
      current.add(priority);
    }
    state = state.copyWith(topPriorities: current);
  }

  void setManifestingDescription(String v) =>
      state = state.copyWith(manifestingDescription: v);
  void setHoldingYouBack(String v) =>
      state = state.copyWith(holdingYouBack: v);
  void setDreamCity(String v) => state = state.copyWith(dreamCity: v);
  void setDreamHome(String v) => state = state.copyWith(dreamHome: v);
  void setManifestingPerson(String v) =>
      state = state.copyWith(manifestingPerson: v);
  void setKindOfPartner(String v) => state = state.copyWith(kindOfPartner: v);
  void setManifestingPersonName(String v) =>
      state = state.copyWith(manifestingPersonName: v);
  void setDreamCar(String v) => state = state.copyWith(dreamCar: v);
}

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>(
      (ref) => OnboardingNotifier(),
    );
