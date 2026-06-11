import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moonlight/features/onboarding/viewmodel/onboarding/onboarding_viewmodel.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class AgeDrumPicker extends ConsumerStatefulWidget {
  final int minAge;
  final int maxAge;

  const AgeDrumPicker({super.key, this.minAge = 13, this.maxAge = 100});

  @override
  ConsumerState<AgeDrumPicker> createState() => _AgeDrumPickerState();
}

class _AgeDrumPickerState extends ConsumerState<AgeDrumPicker> {
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    final initialAge = ref.read(onboardingProvider).age;
    _scrollController = FixedExtentScrollController(
      initialItem: initialAge - widget.minAge,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedAge = ref.watch(onboardingProvider).age;
    final notifier = ref.read(onboardingProvider.notifier);
    final itemHeight = AppSizes.height(9);

    return Center(
      child: SizedBox(
        height: AppSizes.height(35),
        width: AppSizes.width(70),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Fixed highlight box — never moves
            Center(
              child: Container(
                height: itemHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radius(4)),
                  border: Border.all(color: AppColors.primary, width: 0.5),
                ),
              ),
            ),

            // Scrolling wheel on top
            ListWheelScrollView.useDelegate(
              controller: _scrollController,
              itemExtent: itemHeight,
              perspective: 0.0001,
              diameterRatio: 100,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                notifier.setAge(widget.minAge + index);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: widget.maxAge - widget.minAge + 1,
                builder: (context, index) {
                  final age = widget.minAge + index;
                  final diff = (age - selectedAge).abs();

                  double fontSize;
                  double opacity;
                  Color color;

                  if (diff == 0) {
                    fontSize = AppSizes.font(32);
                    opacity = 1.0;
                    color = AppColors.textPrimary;
                  } else if (diff == 1) {
                    fontSize = AppSizes.font(20);
                    opacity = 0.5;
                    color = AppColors.textSecondary;
                  } else {
                    fontSize = AppSizes.font(16);
                    opacity = 0.3;
                    color = AppColors.textSecondary;
                  }

                  return SizedBox(
                    height: itemHeight,
                    child: Center(
                      child: Opacity(
                        opacity: opacity,
                        child: Text(
                          '$age',
                          style: TextStyle(
                            fontFamily: TextStyles.fontFamily,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w700,
                            color: color,
                            letterSpacing: diff == 0 ? -1.5 : 0,
                            shadows: diff == 0
                                ? [
                                    Shadow(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.4,
                                      ),
                                      blurRadius: 15,
                                    ),
                                  ]
                                : null,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
