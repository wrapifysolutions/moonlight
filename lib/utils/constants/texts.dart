import 'package:flutter/material.dart';

class AppTexts {
  AppTexts._();

  // ─── App ────────────────────────────────────────────────────────────────────
  static const String appName = 'Moonlight';
  static const String appTagline = 'Manifest';

  // ─── Splash ─────────────────────────────────────────────────────────────────
  // Uses appName + appTagline

  // ─── Onboarding — Welcome ───────────────────────────────────────────────────
  static const String welcomeTitle = 'Welcome to';
  static const String welcomeSubtitle = 'Moonlight Manifest.';
  static const String welcomeTagline = 'Your future self is already waiting.';
  static const String getStarted = 'Get Started';
  static const String alreadyMember = 'Already a member? ';
  static const String login = 'Login';

  // ─── Onboarding — Shared ────────────────────────────────────────────────────
  static const String next = 'Next';
  static const String complete = 'Complete';
  static const String stepLabel = 'Step';

  static String stepCounter(int current, int total) =>
      '$stepLabel $current / $total';

  // ─── Onboarding — Language ──────────────────────────────────────────────────
  static const String selectLanguage = 'Select Your Language';

  static const List<Map<String, String>> languageOptions = [
    {'code': 'AR', 'name': 'Arabic'},
    {'code': 'EN', 'name': 'English'},
    {'code': 'IN', 'name': 'Indonesia'},
    {'code': 'RA', 'name': 'Russian'},
  ];

  static const String languageEnglish = 'English';

  // ─── Onboarding — Name ──────────────────────────────────────────────────────
  static const String nameTitlePrimary = 'What should we\n';
  static const String nameTitleAccent = 'call you?';
  static const String yourNameLabel = 'Your Name';
  static const String enterYourNameHint = 'Enter your name...';

  // ─── Onboarding — Age ───────────────────────────────────────────────────────
  static const String ageTitlePrimary = 'How ';
  static const String ageTitleAccent = 'old are\nyou?';

  // ─── Onboarding — DOB ───────────────────────────────────────────────────────
  static const String dobTitlePrimary = 'When ';
  static const String dobTitleAccent = 'were you\nborn?';

  // ─── Onboarding — Gender ────────────────────────────────────────────────────
  static const String genderTitlePrimary = 'What ';
  static const String genderTitleAccent = 'is your\ngender?';

  static const List<Map<String, dynamic>> genderOptions = [
    {'label': 'Female', 'icon': Icons.female},
    {'label': 'Male', 'icon': Icons.male},
    {'label': 'Non-binary', 'icon': Icons.transgender},
    {'label': 'Prefer not to say', 'icon': Icons.visibility_off_outlined},
  ];

  // ─── Onboarding — Orientation ───────────────────────────────────────────────
  static const String orientationTitlePrimary = "What's ";
  static const String orientationTitleAccent = 'your\nsexual orientation?';

  static const List<String> sexualOrientationOptions = [
    'Straight',
    'Gay',
    'Lesbian',
    'Prefer not to say',
  ];

  // ─── Onboarding — Children ──────────────────────────────────────────────────
  static const String childrenTitlePrimary = 'Do ';
  static const String childrenTitleAccent = 'you have\nchildren?';

  static const List<Map<String, dynamic>> childrenOptions = [
    {'label': 'Yes, I have children', 'icon': Icons.group},
    {'label': 'No, I do not', 'icon': Icons.person_outline},
  ];

  // ─── Onboarding — About ─────────────────────────────────────────────────────
  static const String aboutTitlePrimary = 'Tell us ';
  static const String aboutTitleAccent = 'about\nyourself...';
  static const String aboutHint =
      'Share a little about who you are, your personality, and what matters to you.';

  // ─── Onboarding — Work ──────────────────────────────────────────────────────
  static const String workTitlePrimary = 'What do you ';
  static const String workTitleAccent = 'do\nfor work?';
  static const String workHint =
      'Describe your job, career, or what you currently do professionally.';

  // ─── Onboarding — Work Feel ───────────────────────────────────────────────────
  static const String workFeelTitlePrimary = 'How does your\n';
  static const String workFeelTitleAccent = 'work feel lately?';

  static const List<Map<String, dynamic>> workFeelOptions = [
    {'label': 'Aligned & exciting', 'icon': Icons.bolt},
    {'label': 'Comfortable but not fulfilling', 'icon': Icons.bed_outlined},
    {'label': 'Temporary', 'icon': Icons.timer_outlined},
    {'label': 'Draining', 'icon': Icons.battery_1_bar},
    {'label': 'Building exit', 'icon': Icons.exit_to_app},
  ];

  // ─── Onboarding — Biggest Lesson ────────────────────────────────────────────
  static const String biggestLessonTitlePrimary = "What's the\nbiggest lesson\n";
  static const String biggestLessonTitleAccent =
      'that made you\nthe person you\nare today?';
  static const String biggestLessonHint =
      'Share an important life lesson that shaped who you are today.';

  // ─── Onboarding — Struggling ────────────────────────────────────────────────
  static const String strugglingTitlePrimary = 'Are you\nstruggling with\n';
  static const String strugglingTitleAccent = 'anything at the\nmoment?';
  static const String strugglingHint =
      'Write about a challenge you are currently facing.';

  // ─── Onboarding — Love Life ─────────────────────────────────────────────────
  static const String loveLifeTitlePrimary = 'What is your current\n';
  static const String loveLifeTitleAccent = 'love life status?';

  static const List<String> loveLifeOptions = [
    'Single & manifesting',
    'In a relationship',
    'Married',
    'Complicated',
    'Focused on myself',
  ];

  // ─── Onboarding — Priorities ────────────────────────────────────────────────
  static const String prioritiesTitlePrimary = 'What are your\n';
  static const String prioritiesTitleAccent = 'top priorities?';

  static const List<String> priorityOptions = [
    'Relationship',
    'Wealth',
    'Career',
    'Spirituality',
    'Health',
    'Travel',
    'Family',
    'Confidence',
  ];

  // ─── Onboarding — Manifesting ─────────────────────────────────────────────────
  static const String manifestingTitlePrimary = 'Describe the life, feelings,\n';
  static const String manifestingTitleAccent =
      "and achievements you're manifesting.";
  static const String manifestingHint =
      'Describe the life you want to create and how it will feel.';

  // ─── Onboarding — Holding Back ──────────────────────────────────────────────
  static const String holdingBackTitlePrimary =
      'What do you feel is holding you back\n';
  static const String holdingBackTitleAccent =
      'from living your dream life right now?';
  static const String holdingBackHint =
      'Share what you think is currently blocking your progress.';

  // ─── Onboarding — Dream City ─────────────────────────────────────────────────
  static const String dreamCityTitlePrimary = 'Do you have a dream city\n';
  static const String dreamCityTitleAccent =
      "or country you'd love to live in?";
  static const String dreamCityHint =
      'For example: Bali, New York, London...';

  // ─── Onboarding — Dream Home ──────────────────────────────────────────────────
  static const String dreamHomeTitlePrimary = "What's your ";
  static const String dreamHomeTitleAccent = 'dream home?';

  static const List<String> dreamHomeOptions = [
    'Luxury Penthouse',
    'Beachfront Vila',
    'Modern Loft',
    'Suburban Mansion',
    'Cottage',
    'Cabin',
    'Chic Townhouse',
  ];

  // ─── Onboarding — Manifesting Person ────────────────────────────────────────
  static const String manifestingPersonTitlePrimary = 'Are you manifesting\n';
  static const String manifestingPersonTitleAccent = 'a specific person?';
  static const String manifestingPersonYes = 'Yes, I am';
  static const String manifestingPersonNotNow = 'Not right now';

  static const List<Map<String, dynamic>> manifestingPersonOptions = [
    {'label': manifestingPersonYes, 'icon': Icons.group},
    {'label': manifestingPersonNotNow, 'icon': Icons.person_outline},
  ];

  // ─── Onboarding — Partner Kind ──────────────────────────────────────────────
  static const String partnerKindTitlePrimary = 'What kind of partner\n';
  static const String partnerKindTitleAccent =
      'are you manifesting into your life?';
  static const String partnerKindHint =
      'Describe the qualities of your ideal partner.';

  // ─── Onboarding — Person Name ─────────────────────────────────────────────────
  static const String personNameTitlePrimary =
      "What's the name of the person\n";
  static const String personNameTitleAccent = "you're manifesting?";
  static const String personNameHint =
      'Enter the name or type "Someone special"';

  // ─── Onboarding — Dream Car ───────────────────────────────────────────────────
  static const String dreamCarTitlePrimary = "what's your ";
  static const String dreamCarTitleAccent = 'dream car?';
  static const String dreamCarHint =
      'Enter the car you dream of owning one day.';

  // ─── Paywall ────────────────────────────────────────────────────────────────
  static const String chooseYourJourney = 'Choose Your\nJourney';
  static const String unlockFullPower =
      'Unlock the full power of your\nmanifestations.';
  static const String weekly = 'Weekly';
  static const String monthly = 'Monthly';
  static const String threeMonths = '3 Months';
  static const String standard = 'Standard';
  static const String bestValue = 'Best Value';
  static const String mostPopular = 'Most Popular';
  static const String commitmentPlan = 'Commitment Plan';
  static const String weeklyPrice = r'$4.99';
  static const String monthlyPrice = r'$6.99';
  static const String threeMonthsPrice = r'$20.99';
  static const String payWithApplePay = 'Pay with Apple Pay';
  static const String payWithCard = 'Pay with Card';
  static const String autoRenewNotice =
      'Subscription will auto-renew. Cancel anytime in settings.\nBy continuing, you agree to our Terms and Privacy Policy.';

  // ─── Journey Log ────────────────────────────────────────────────────────────
  static const String journeyLog = 'Journey Log';
  static const String celestialAlignmentComplete =
      'The celestial alignment is complete.';
  static const String continueTheJourney = 'Continue the Journey';
  static const String securedBy = 'Secured by Moonlight Encryption';
  static const String paymentProcessed = 'Payment Processed';
  static const String paymentProcessedSubtitle =
      'Your energy contribution has been received by the ether.';
  static const String manifestationConfirmed = 'Manifestation Confirmed';
  static const String manifestationConfirmedSubtitle =
      'The universe has acknowledged your intent. Alignment is stable.';
  static const String experienceUnlocked = 'Experience Unlocked';
  static const String experienceUnlockedSubtitle =
      'The gateway to your moonlight experience is now fully open.';

  // ─── Processing ─────────────────────────────────────────────────────────────
  static const String aligningFrequencies =
      'Aligning your energetic frequencies...';
  static const String consultingMaps = 'Consulting the celestial maps...';
  static const String designingRituals =
      'Designing your personalized rituals...';
  static const String preparingPath = 'Preparing your manifestation path...';

  static const List<String> processingMessages = [
    aligningFrequencies,
    consultingMaps,
    designingRituals,
    preparingPath,
  ];

  // ─── Home (placeholder) ─────────────────────────────────────────────────────
  static const String homeTitle = 'Moonlight';
  static const String homeCounterPrompt =
      'You have pushed the button this many times:';
  static const String toggleTheme = 'Toggle theme';
  static const String increment = 'Increment';

  // ─── Dashboard (future) ─────────────────────────────────────────────────────
  static const String hello = 'Hello, ';
  static const String todaysAlignment = "Today's Alignment";
  static const String todaysStories = "Today's Stories";
  static const String affirmationCards = 'Affirmation Cards';
  static const String createManifestation = 'Create Manifestation';
  static const String yourDailyEnergy = 'Your daily energy';
  static const String quickEntry = 'Quick Entry';
  static const String exploreNow = 'Explore Now';
  static const String guidedSessions = '6 guided sessions ready for you';
  static const String manifestationComplete =
      'Your manifestation for today is complete.';
  static const String returnIn24 = 'Return in 24 hours to write a new one';
  static const String saveManifestation = 'Save Manifestation';
  static const String whatManifestingToday = 'What are you manifesting today?';
  static const String typeHere = 'Type here...';

  // ─── Navigation ───────────────────────────────────────────────────────────
  static const String navHome = 'Home';
  static const String navReflect = 'Reflect';
  static const String navProgress = 'Progress';
  static const String navSettings = 'Settings';

  // ─── Settings ─────────────────────────────────────────────────────────────
  static const String languageSelection = 'Language Selection';
  static const String savedVoices = 'Saved Voices';
  static const String maleVoice = 'Male Voice';
  static const String femaleVoice = 'Female Voice';

  // ─── Progress ─────────────────────────────────────────────────────────────
  static const String weeklyAlignment = 'Weekly Alignment';
  static const String currentStreak = 'Current Streak';
  static const String totalReflections = 'Total Reflections';
  static const String goalsAchieved = 'Goals Achieved';
  static const String alignmentGrowth = 'Alignment Growth';
  static const String recentAchievements = 'Recent Achievements';
  static const String yourProgress = 'Your Progress';
  static const String overview = 'Overview';

  // ─── AI Coach ─────────────────────────────────────────────────────────────
  static const String alignmentCoach = 'Alignment Coach';
  static const String coachGreeting =
      "Hello! I'm here to support your growth journey. What's on your mind today?";
  static const String shareyourThoughts = 'Share your thoughts...';
  static const String suggestedReflections = 'Suggested reflections:';
}
