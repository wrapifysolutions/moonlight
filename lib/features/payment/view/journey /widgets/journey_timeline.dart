import 'package:flutter/material.dart';

import 'package:moonlight/features/payment/view/journey /widgets/milestone_item.dart';
import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';

class JourneyTimeline extends StatelessWidget {
  const JourneyTimeline({
    super.key,
    required this.lineProgress,
    required this.item1Opacity,
    required this.item1Active,
    required this.item2Opacity,
    required this.item2Active,
    required this.item3Opacity,
    required this.item3Active,
    required this.iconSize,
    required this.itemGap,
  });

  final double lineProgress;
  final double item1Opacity;
  final bool item1Active;
  final double item2Opacity;
  final bool item2Active;
  final double item3Opacity;
  final bool item3Active;
  final double iconSize;
  final double itemGap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return IntrinsicHeight(
      child: Stack(
        children: [
          Positioned(
            left: iconSize / 2 - 0.5,
            top: iconSize / 2,
            bottom: iconSize / 2,
            width: 1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final lineHeight = constraints.maxHeight;

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: AppColors.journeyTimelineTrack,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 1,
                        height: lineHeight * lineProgress,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.journeyTimelineFillStart,
                              AppColors.journeyTimelineFillEnd,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MilestoneItem(
                opacity: item1Opacity,
                isActive: item1Active,
                iconSize: iconSize,
                icon: Icons.receipt_outlined,
                title: l10n.paymentProcessed,
                subtitle: l10n.paymentProcessedSubtitle,
              ),
              SizedBox(height: itemGap),
              MilestoneItem(
                opacity: item2Opacity,
                isActive: item2Active,
                iconSize: iconSize,
                icon: Icons.remove_red_eye_outlined,
                title: l10n.manifestationConfirmed,
                subtitle: l10n.manifestationConfirmedSubtitle,
              ),
              SizedBox(height: itemGap),
              MilestoneItem(
                opacity: item3Opacity,
                isActive: item3Active,
                iconSize: iconSize,
                icon: Icons.lock_open_outlined,
                title: l10n.experienceUnlocked,
                subtitle: l10n.experienceUnlockedSubtitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
