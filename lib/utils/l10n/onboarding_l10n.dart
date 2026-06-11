import 'package:flutter/material.dart';

import 'package:moonlight/l10n/app_localizations.dart';

class OnboardingL10n {
  OnboardingL10n._();

  static const List<Map<String, String>> languageOptionCodes = [
    {'code': 'AR'},
    {'code': 'EN'},
    {'code': 'IN'},
    {'code': 'RA'},
  ];

  static String languageDisplayName(AppLocalizations l10n, String code) {
    return switch (code) {
      'AR' => l10n.languageNameArabic,
      'EN' => l10n.languageNameEnglish,
      'IN' => l10n.languageNameIndonesia,
      'RA' => l10n.languageNameRussian,
      _ => l10n.languageNameEnglish,
    };
  }

  static List<Map<String, dynamic>> genderOptions(AppLocalizations l10n) => [
        {'label': l10n.genderFemale, 'icon': Icons.female},
        {'label': l10n.genderMale, 'icon': Icons.male},
        {'label': l10n.genderNonBinary, 'icon': Icons.transgender},
        {
          'label': l10n.genderPreferNotToSay,
          'icon': Icons.visibility_off_outlined,
        },
      ];

  static List<String> sexualOrientationOptions(AppLocalizations l10n) => [
        l10n.orientationStraight,
        l10n.orientationGay,
        l10n.orientationLesbian,
        l10n.orientationPreferNotToSay,
      ];

  static List<Map<String, dynamic>> childrenOptions(AppLocalizations l10n) =>
      [
        {'label': l10n.childrenYes, 'icon': Icons.group},
        {'label': l10n.childrenNo, 'icon': Icons.person_outline},
      ];

  static List<Map<String, dynamic>> workFeelOptions(AppLocalizations l10n) => [
        {'label': l10n.workFeelAligned, 'icon': Icons.bolt},
        {
          'label': l10n.workFeelComfortable,
          'icon': Icons.bed_outlined,
        },
        {'label': l10n.workFeelTemporary, 'icon': Icons.timer_outlined},
        {'label': l10n.workFeelDraining, 'icon': Icons.battery_1_bar},
        {'label': l10n.workFeelBuildingExit, 'icon': Icons.exit_to_app},
      ];

  static List<String> loveLifeOptions(AppLocalizations l10n) => [
        l10n.loveLifeSingle,
        l10n.loveLifeInRelationship,
        l10n.loveLifeMarried,
        l10n.loveLifeComplicated,
        l10n.loveLifeFocusedOnMyself,
      ];

  static List<String> priorityOptions(AppLocalizations l10n) => [
        l10n.priorityRelationship,
        l10n.priorityWealth,
        l10n.priorityCareer,
        l10n.prioritySpirituality,
        l10n.priorityHealth,
        l10n.priorityTravel,
        l10n.priorityFamily,
        l10n.priorityConfidence,
      ];

  static List<String> dreamHomeOptions(AppLocalizations l10n) => [
        l10n.dreamHomeLuxuryPenthouse,
        l10n.dreamHomeBeachfrontVila,
        l10n.dreamHomeModernLoft,
        l10n.dreamHomeSuburbanMansion,
        l10n.dreamHomeCottage,
        l10n.dreamHomeCabin,
        l10n.dreamHomeChicTownhouse,
      ];

  static List<Map<String, dynamic>> manifestingPersonOptions(
    AppLocalizations l10n,
  ) =>
      [
        {'label': l10n.manifestingPersonYes, 'icon': Icons.group},
        {'label': l10n.manifestingPersonNotNow, 'icon': Icons.person_outline},
      ];

  static List<String> processingMessages(AppLocalizations l10n) => [
        l10n.aligningFrequencies,
        l10n.consultingMaps,
        l10n.designingRituals,
        l10n.preparingPath,
      ];
}
