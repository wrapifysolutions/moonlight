import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('id'),
    Locale('ru'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Moonlight'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Manifest'**
  String get appTagline;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Moonlight Manifest.'**
  String get welcomeSubtitle;

  /// No description provided for @welcomeTagline.
  ///
  /// In en, this message translates to:
  /// **'Your future self is already waiting.'**
  String get welcomeTagline;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @alreadyMember.
  ///
  /// In en, this message translates to:
  /// **'Already a member? '**
  String get alreadyMember;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @stepCounter.
  ///
  /// In en, this message translates to:
  /// **'Step {current} / {total}'**
  String stepCounter(int current, int total);

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Your Language'**
  String get selectLanguage;

  /// No description provided for @languageNameArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get languageNameArabic;

  /// No description provided for @languageNameEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageNameEnglish;

  /// No description provided for @languageNameIndonesia.
  ///
  /// In en, this message translates to:
  /// **'Indonesia'**
  String get languageNameIndonesia;

  /// No description provided for @languageNameRussian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get languageNameRussian;

  /// No description provided for @nameTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'What should we\n'**
  String get nameTitlePrimary;

  /// No description provided for @nameTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'call you?'**
  String get nameTitleAccent;

  /// No description provided for @yourNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get yourNameLabel;

  /// No description provided for @enterYourNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name...'**
  String get enterYourNameHint;

  /// No description provided for @ageTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'How '**
  String get ageTitlePrimary;

  /// No description provided for @ageTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'old are\nyou?'**
  String get ageTitleAccent;

  /// No description provided for @dobTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'When '**
  String get dobTitlePrimary;

  /// No description provided for @dobTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'were you\nborn?'**
  String get dobTitleAccent;

  /// No description provided for @genderTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'What '**
  String get genderTitlePrimary;

  /// No description provided for @genderTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'is your\ngender?'**
  String get genderTitleAccent;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderNonBinary.
  ///
  /// In en, this message translates to:
  /// **'Non-binary'**
  String get genderNonBinary;

  /// No description provided for @genderPreferNotToSay.
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get genderPreferNotToSay;

  /// No description provided for @orientationTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'What\'s '**
  String get orientationTitlePrimary;

  /// No description provided for @orientationTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'your\nsexual orientation?'**
  String get orientationTitleAccent;

  /// No description provided for @orientationStraight.
  ///
  /// In en, this message translates to:
  /// **'Straight'**
  String get orientationStraight;

  /// No description provided for @orientationGay.
  ///
  /// In en, this message translates to:
  /// **'Gay'**
  String get orientationGay;

  /// No description provided for @orientationLesbian.
  ///
  /// In en, this message translates to:
  /// **'Lesbian'**
  String get orientationLesbian;

  /// No description provided for @orientationPreferNotToSay.
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get orientationPreferNotToSay;

  /// No description provided for @childrenTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'Do '**
  String get childrenTitlePrimary;

  /// No description provided for @childrenTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'you have\nchildren?'**
  String get childrenTitleAccent;

  /// No description provided for @childrenYes.
  ///
  /// In en, this message translates to:
  /// **'Yes, I have children'**
  String get childrenYes;

  /// No description provided for @childrenNo.
  ///
  /// In en, this message translates to:
  /// **'No, I do not'**
  String get childrenNo;

  /// No description provided for @aboutTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'Tell us '**
  String get aboutTitlePrimary;

  /// No description provided for @aboutTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'about\nyourself...'**
  String get aboutTitleAccent;

  /// No description provided for @aboutHint.
  ///
  /// In en, this message translates to:
  /// **'Share a little about who you are, your personality, and what matters to you.'**
  String get aboutHint;

  /// No description provided for @workTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'What do you '**
  String get workTitlePrimary;

  /// No description provided for @workTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'do\nfor work?'**
  String get workTitleAccent;

  /// No description provided for @workHint.
  ///
  /// In en, this message translates to:
  /// **'Describe your job, career, or what you currently do professionally.'**
  String get workHint;

  /// No description provided for @workFeelTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'How does your\n'**
  String get workFeelTitlePrimary;

  /// No description provided for @workFeelTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'work feel lately?'**
  String get workFeelTitleAccent;

  /// No description provided for @workFeelAligned.
  ///
  /// In en, this message translates to:
  /// **'Aligned & exciting'**
  String get workFeelAligned;

  /// No description provided for @workFeelComfortable.
  ///
  /// In en, this message translates to:
  /// **'Comfortable but not fulfilling'**
  String get workFeelComfortable;

  /// No description provided for @workFeelTemporary.
  ///
  /// In en, this message translates to:
  /// **'Temporary'**
  String get workFeelTemporary;

  /// No description provided for @workFeelDraining.
  ///
  /// In en, this message translates to:
  /// **'Draining'**
  String get workFeelDraining;

  /// No description provided for @workFeelBuildingExit.
  ///
  /// In en, this message translates to:
  /// **'Building exit'**
  String get workFeelBuildingExit;

  /// No description provided for @biggestLessonTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'What\'s the\nbiggest lesson\n'**
  String get biggestLessonTitlePrimary;

  /// No description provided for @biggestLessonTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'that made you\nthe person you\nare today?'**
  String get biggestLessonTitleAccent;

  /// No description provided for @biggestLessonHint.
  ///
  /// In en, this message translates to:
  /// **'Share an important life lesson that shaped who you are today.'**
  String get biggestLessonHint;

  /// No description provided for @strugglingTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'Are you\nstruggling with\n'**
  String get strugglingTitlePrimary;

  /// No description provided for @strugglingTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'anything at the\nmoment?'**
  String get strugglingTitleAccent;

  /// No description provided for @strugglingHint.
  ///
  /// In en, this message translates to:
  /// **'Write about a challenge you are currently facing.'**
  String get strugglingHint;

  /// No description provided for @loveLifeTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'What is your current\n'**
  String get loveLifeTitlePrimary;

  /// No description provided for @loveLifeTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'love life status?'**
  String get loveLifeTitleAccent;

  /// No description provided for @loveLifeSingle.
  ///
  /// In en, this message translates to:
  /// **'Single & manifesting'**
  String get loveLifeSingle;

  /// No description provided for @loveLifeInRelationship.
  ///
  /// In en, this message translates to:
  /// **'In a relationship'**
  String get loveLifeInRelationship;

  /// No description provided for @loveLifeMarried.
  ///
  /// In en, this message translates to:
  /// **'Married'**
  String get loveLifeMarried;

  /// No description provided for @loveLifeComplicated.
  ///
  /// In en, this message translates to:
  /// **'Complicated'**
  String get loveLifeComplicated;

  /// No description provided for @loveLifeFocusedOnMyself.
  ///
  /// In en, this message translates to:
  /// **'Focused on myself'**
  String get loveLifeFocusedOnMyself;

  /// No description provided for @prioritiesTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'What are your\n'**
  String get prioritiesTitlePrimary;

  /// No description provided for @prioritiesTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'top priorities?'**
  String get prioritiesTitleAccent;

  /// No description provided for @priorityRelationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get priorityRelationship;

  /// No description provided for @priorityWealth.
  ///
  /// In en, this message translates to:
  /// **'Wealth'**
  String get priorityWealth;

  /// No description provided for @priorityCareer.
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get priorityCareer;

  /// No description provided for @prioritySpirituality.
  ///
  /// In en, this message translates to:
  /// **'Spirituality'**
  String get prioritySpirituality;

  /// No description provided for @priorityHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get priorityHealth;

  /// No description provided for @priorityTravel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get priorityTravel;

  /// No description provided for @priorityFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get priorityFamily;

  /// No description provided for @priorityConfidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get priorityConfidence;

  /// No description provided for @manifestingTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'Describe the life, feelings,\n'**
  String get manifestingTitlePrimary;

  /// No description provided for @manifestingTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'and achievements you\'re manifesting.'**
  String get manifestingTitleAccent;

  /// No description provided for @manifestingHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the life you want to create and how it will feel.'**
  String get manifestingHint;

  /// No description provided for @holdingBackTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'What do you feel is holding you back\n'**
  String get holdingBackTitlePrimary;

  /// No description provided for @holdingBackTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'from living your dream life right now?'**
  String get holdingBackTitleAccent;

  /// No description provided for @holdingBackHint.
  ///
  /// In en, this message translates to:
  /// **'Share what you think is currently blocking your progress.'**
  String get holdingBackHint;

  /// No description provided for @dreamCityTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'Do you have a dream city\n'**
  String get dreamCityTitlePrimary;

  /// No description provided for @dreamCityTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'or country you\'d love to live in?'**
  String get dreamCityTitleAccent;

  /// No description provided for @dreamCityHint.
  ///
  /// In en, this message translates to:
  /// **'For example: Bali, New York, London...'**
  String get dreamCityHint;

  /// No description provided for @dreamHomeTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'What\'s your '**
  String get dreamHomeTitlePrimary;

  /// No description provided for @dreamHomeTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'dream home?'**
  String get dreamHomeTitleAccent;

  /// No description provided for @dreamHomeLuxuryPenthouse.
  ///
  /// In en, this message translates to:
  /// **'Luxury Penthouse'**
  String get dreamHomeLuxuryPenthouse;

  /// No description provided for @dreamHomeBeachfrontVila.
  ///
  /// In en, this message translates to:
  /// **'Beachfront Vila'**
  String get dreamHomeBeachfrontVila;

  /// No description provided for @dreamHomeModernLoft.
  ///
  /// In en, this message translates to:
  /// **'Modern Loft'**
  String get dreamHomeModernLoft;

  /// No description provided for @dreamHomeSuburbanMansion.
  ///
  /// In en, this message translates to:
  /// **'Suburban Mansion'**
  String get dreamHomeSuburbanMansion;

  /// No description provided for @dreamHomeCottage.
  ///
  /// In en, this message translates to:
  /// **'Cottage'**
  String get dreamHomeCottage;

  /// No description provided for @dreamHomeCabin.
  ///
  /// In en, this message translates to:
  /// **'Cabin'**
  String get dreamHomeCabin;

  /// No description provided for @dreamHomeChicTownhouse.
  ///
  /// In en, this message translates to:
  /// **'Chic Townhouse'**
  String get dreamHomeChicTownhouse;

  /// No description provided for @manifestingPersonTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'Are you manifesting\n'**
  String get manifestingPersonTitlePrimary;

  /// No description provided for @manifestingPersonTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'a specific person?'**
  String get manifestingPersonTitleAccent;

  /// No description provided for @manifestingPersonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes, I am'**
  String get manifestingPersonYes;

  /// No description provided for @manifestingPersonNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not right now'**
  String get manifestingPersonNotNow;

  /// No description provided for @partnerKindTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'What kind of partner\n'**
  String get partnerKindTitlePrimary;

  /// No description provided for @partnerKindTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'are you manifesting into your life?'**
  String get partnerKindTitleAccent;

  /// No description provided for @partnerKindHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the qualities of your ideal partner.'**
  String get partnerKindHint;

  /// No description provided for @personNameTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'What\'s the name of the person\n'**
  String get personNameTitlePrimary;

  /// No description provided for @personNameTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'you\'re manifesting?'**
  String get personNameTitleAccent;

  /// No description provided for @personNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the name or type \"Someone special\"'**
  String get personNameHint;

  /// No description provided for @dreamCarTitlePrimary.
  ///
  /// In en, this message translates to:
  /// **'what\'s your '**
  String get dreamCarTitlePrimary;

  /// No description provided for @dreamCarTitleAccent.
  ///
  /// In en, this message translates to:
  /// **'dream car?'**
  String get dreamCarTitleAccent;

  /// No description provided for @dreamCarHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the car you dream of owning one day.'**
  String get dreamCarHint;

  /// No description provided for @chooseYourJourney.
  ///
  /// In en, this message translates to:
  /// **'Choose Your\nJourney'**
  String get chooseYourJourney;

  /// No description provided for @unlockFullPower.
  ///
  /// In en, this message translates to:
  /// **'Unlock the full power of your\nmanifestations.'**
  String get unlockFullPower;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @threeMonths.
  ///
  /// In en, this message translates to:
  /// **'3 Months'**
  String get threeMonths;

  /// No description provided for @standard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get standard;

  /// No description provided for @bestValue.
  ///
  /// In en, this message translates to:
  /// **'Best Value'**
  String get bestValue;

  /// No description provided for @mostPopular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get mostPopular;

  /// No description provided for @commitmentPlan.
  ///
  /// In en, this message translates to:
  /// **'Commitment Plan'**
  String get commitmentPlan;

  /// No description provided for @weeklyPrice.
  ///
  /// In en, this message translates to:
  /// **'\$4.99'**
  String get weeklyPrice;

  /// No description provided for @monthlyPrice.
  ///
  /// In en, this message translates to:
  /// **'\$6.99'**
  String get monthlyPrice;

  /// No description provided for @threeMonthsPrice.
  ///
  /// In en, this message translates to:
  /// **'\$20.99'**
  String get threeMonthsPrice;

  /// No description provided for @payWithApplePay.
  ///
  /// In en, this message translates to:
  /// **'Pay with Apple Pay'**
  String get payWithApplePay;

  /// No description provided for @payWithCard.
  ///
  /// In en, this message translates to:
  /// **'Pay with Card'**
  String get payWithCard;

  /// No description provided for @autoRenewNotice.
  ///
  /// In en, this message translates to:
  /// **'Subscription will auto-renew. Cancel anytime in settings.\nBy continuing, you agree to our Terms and Privacy Policy.'**
  String get autoRenewNotice;

  /// No description provided for @journeyLog.
  ///
  /// In en, this message translates to:
  /// **'Journey Log'**
  String get journeyLog;

  /// No description provided for @celestialAlignmentComplete.
  ///
  /// In en, this message translates to:
  /// **'The celestial alignment is complete.'**
  String get celestialAlignmentComplete;

  /// No description provided for @continueTheJourney.
  ///
  /// In en, this message translates to:
  /// **'Continue the Journey'**
  String get continueTheJourney;

  /// No description provided for @securedBy.
  ///
  /// In en, this message translates to:
  /// **'Secured by Moonlight Encryption'**
  String get securedBy;

  /// No description provided for @paymentProcessed.
  ///
  /// In en, this message translates to:
  /// **'Payment Processed'**
  String get paymentProcessed;

  /// No description provided for @paymentProcessedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your energy contribution has been received by the ether.'**
  String get paymentProcessedSubtitle;

  /// No description provided for @manifestationConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Manifestation Confirmed'**
  String get manifestationConfirmed;

  /// No description provided for @manifestationConfirmedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The universe has acknowledged your intent. Alignment is stable.'**
  String get manifestationConfirmedSubtitle;

  /// No description provided for @experienceUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Experience Unlocked'**
  String get experienceUnlocked;

  /// No description provided for @experienceUnlockedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The gateway to your moonlight experience is now fully open.'**
  String get experienceUnlockedSubtitle;

  /// No description provided for @aligningFrequencies.
  ///
  /// In en, this message translates to:
  /// **'Aligning your energetic frequencies...'**
  String get aligningFrequencies;

  /// No description provided for @consultingMaps.
  ///
  /// In en, this message translates to:
  /// **'Consulting the celestial maps...'**
  String get consultingMaps;

  /// No description provided for @designingRituals.
  ///
  /// In en, this message translates to:
  /// **'Designing your personalized rituals...'**
  String get designingRituals;

  /// No description provided for @preparingPath.
  ///
  /// In en, this message translates to:
  /// **'Preparing your manifestation path...'**
  String get preparingPath;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Moonlight'**
  String get homeTitle;

  /// No description provided for @homeCounterPrompt.
  ///
  /// In en, this message translates to:
  /// **'You have pushed the button this many times:'**
  String get homeCounterPrompt;

  /// No description provided for @toggleTheme.
  ///
  /// In en, this message translates to:
  /// **'Toggle theme'**
  String get toggleTheme;

  /// No description provided for @increment.
  ///
  /// In en, this message translates to:
  /// **'Increment'**
  String get increment;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'id', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
