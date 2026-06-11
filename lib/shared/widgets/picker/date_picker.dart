import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moonlight/features/onboarding/viewmodel/onboarding/onboarding_viewmodel.dart';
import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class DateDrumPicker extends ConsumerStatefulWidget {
  const DateDrumPicker({super.key});

  @override
  ConsumerState<DateDrumPicker> createState() => _DateDrumPickerState();
}

class _DateDrumPickerState extends ConsumerState<DateDrumPicker> {
  late FixedExtentScrollController _monthController;
  late FixedExtentScrollController _dayController;
  late FixedExtentScrollController _yearController;

  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  final int _startYear = 1940;
  final int _endYear = DateTime.now().year - 5;

  @override
  void initState() {
    super.initState();
    final dob = ref.read(onboardingProvider).dob;
    _monthController = FixedExtentScrollController(initialItem: dob.month - 1);
    _dayController = FixedExtentScrollController(initialItem: dob.day - 1);
    _yearController = FixedExtentScrollController(
      initialItem: dob.year - _startYear,
    );
  }

  @override
  void dispose() {
    _monthController.dispose();
    _dayController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  void _updateDob({int? month, int? day, int? year}) {
    final current = ref.read(onboardingProvider).dob;
    final newDob = DateTime(
      year ?? current.year,
      month ?? current.month,
      day ?? current.day,
    );
    ref.read(onboardingProvider.notifier).setDob(newDob);
  }

  @override
  Widget build(BuildContext context) {
    final dob = ref.watch(onboardingProvider).dob;
    final itemHeight = AppSizes.height(7);

    return SizedBox(
      height: AppSizes.height(32),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Fixed highlight box
          Center(
            child: Container(
              height: itemHeight,
              margin: EdgeInsets.symmetric(horizontal: AppSizes.width(2)),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSizes.radius(4)),
                border: Border.all(color: AppColors.primary, width: 0.5),
              ),
            ),
          ),

          // Three columns
          Row(
            children: [
              // Month
              Expanded(
                child: _DrumColumn(
                  controller: _monthController,
                  itemHeight: itemHeight,
                  itemCount: 12,
                  selectedIndex: dob.month - 1,
                  labelBuilder: (i) => _months[i],
                  onChanged: (i) => _updateDob(month: i + 1),
                ),
              ),

              // Day
              Expanded(
                child: _DrumColumn(
                  controller: _dayController,
                  itemHeight: itemHeight,
                  itemCount: 31,
                  selectedIndex: dob.day - 1,
                  labelBuilder: (i) => '${i + 1}',
                  onChanged: (i) => _updateDob(day: i + 1),
                ),
              ),

              // Year
              Expanded(
                child: _DrumColumn(
                  controller: _yearController,
                  itemHeight: itemHeight,
                  itemCount: _endYear - _startYear + 1,
                  selectedIndex: dob.year - _startYear,
                  labelBuilder: (i) => '${_startYear + i}',
                  onChanged: (i) => _updateDob(year: _startYear + i),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DrumColumn extends StatelessWidget {
  final FixedExtentScrollController controller;
  final double itemHeight;
  final int itemCount;
  final int selectedIndex;
  final String Function(int) labelBuilder;
  final ValueChanged<int> onChanged;

  const _DrumColumn({
    required this.controller,
    required this.itemHeight,
    required this.itemCount,
    required this.selectedIndex,
    required this.labelBuilder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      controller: controller,
      itemExtent: itemHeight,
      perspective: 0.0001,
      diameterRatio: 100,
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: onChanged,
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: itemCount,
        builder: (context, index) {
          final diff = (index - selectedIndex).abs();
          final isSelected = diff == 0;

          return SizedBox(
            height: itemHeight,
            child: Center(
              child: Text(
                labelBuilder(index),
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
                style: TextStyle(
                  fontFamily: TextStyles.fontFamily,
                  fontSize: isSelected ? AppSizes.font(14) : AppSizes.font(10),
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  color: isSelected
                      ? const Color(0xFF7C8BFF)
                      : AppColors.textMuted.withValues(alpha: 0.6),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
