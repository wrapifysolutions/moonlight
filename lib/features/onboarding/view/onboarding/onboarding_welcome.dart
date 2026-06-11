import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonlight/core/routes/app_router.dart';
import 'package:moonlight/shared/widgets/button/elevated_button.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class OnboardingWelcome extends StatelessWidget {
  const OnboardingWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.width(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppSizes.height(6)),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${l10n.welcomeTitle}\n',
                        style: TextStyle(
                          fontFamily: TextStyles.fontFamily,
                          fontSize: AppSizes.font(38),
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          height: 1.15,
                        ),
                      ),
                      TextSpan(
                        text: l10n.welcomeSubtitle,
                        style: TextStyle(
                          fontFamily: TextStyles.fontFamily,
                          fontSize: AppSizes.font(26),
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSizes.height(1.5)),
              SizedBox(
                width: double.infinity,
                child: Text(
                  l10n.welcomeTagline,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: TextStyles.fontFamily,
                    fontSize: AppSizes.font(12),
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: CustomElevatedButton(
                  text: l10n.getStarted,

                  width: 65,
                  height: 6,
                  borderRadius: 8,
                  iconPosition: IconPosition.right,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white24,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                  icon: Icon(
                    Icons.arrow_forward,
                    color: AppColors.textPrimary,
                    size: AppSizes.icon(2.5),
                  ),
                  onPressed: () => context.goToOnboardingLanguage(),
                ),
              ),
              SizedBox(height: AppSizes.height(2)),
              SizedBox(
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: l10n.alreadyMember,
                        style: TextStyle(
                          fontFamily: TextStyles.fontFamily,
                          fontSize: AppSizes.font(12),
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            l10n.login,
                            style: TextStyle(
                              fontFamily: TextStyles.fontFamily,
                              fontSize: AppSizes.font(12),
                              fontWeight: FontWeight.w700,
                              color: AppColors.textAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSizes.height(4)),
            ],
          ),
        ),
      ),
    );
  }
}
